/*
  Eric Villasenor
  evillase@gmail.com
  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module dcache (
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  caches_if.dcache cif
);
  // import types
  import cpu_types_pkg::*;

  dcache_frame [7:0] df0;
  dcache_frame [7:0] df1;
  logic [2:0] index, snoopindex;
  logic block;
  logic miss;
  logic [25:0] tag, snooptag;
  
  typedef enum logic[4:0] {IDLE, WRITE0, WRITE1, FETCH0, FETCH1, DIRTY, FLUSH0, FLUSH1, FLUSH2, FLUSH3, HCOUNT, HALT, CHKSNOOP, SEND0, SEND1, INV} stateT;
  stateT state, next;
  logic [7:0]available;
  logic [7:0]next_available;
  integer i;
  word_t hc, nhc;
  logic [3:0] row, nextrow;
  logic [2:0] currrow;
  logic [1:0] last, nlast;
  logic cur, ncur, rdy0, rdy1;
  word_t data0, data1;
  logic ndirty, nvalid;
  logic snoopdirty, snoophit0, snoophit1, nsnoophit0, nsnoophit1, snoopinvalid;
  logic isflush;
  
  word_t link, nextlink;
  logic linkvalid, nlinkvalid;
  logic flushall, nflushall;
  
  
  assign block = dcif.dmemaddr[2];
  assign index = dcif.dmemaddr[5:3];
  assign tag = dcif.dmemaddr[31:6];
  assign snoopindex = cif.ccsnoopaddr[5:3];
  assign snooptag = cif.ccsnoopaddr[31:6];
  assign cif.ccwrite = dcif.dmemWEN;// || state == FLUSH0 || state == FLUSH1 || state == FLUSH2 || state == FLUSH3;
  //assign dcif.flushed = state == HALT;
  assign dcif.flushed = isflush;
  
  
  always_ff @(posedge CLK or negedge nRST)
  begin 
      if(~nRST)
      begin
          df0 <= '0;
          df1 <= '0;
          available <= '0;
          state <= IDLE;
          hc <= 0;
          row <= 0;
          //cur <= 0;
          last <= 0;
          snoophit0 <= 0;
          snoophit1 <= 0;
          isflush <= 0;
          link <= 0;
          linkvalid <= 0;
          flushall <= 0;
      end
      else
      begin
          flushall <= nflushall;
          //if(cur[index] == 0 && (rdy0 || rdy1))
          if(flushall)
          begin
              if(nlast == 1)
              begin
                  df0[currrow].tag     <='0;
                  df0[currrow].data[0] <='0;
                  df0[currrow].data[1] <='0;
                  df0[currrow].valid   <= 0;
                  df0[currrow].dirty   <= 0;
              end
              if(nlast == 2)
              begin
                  df1[currrow].tag     <='0;
                  df1[currrow].data[0] <='0;
                  df1[currrow].data[1] <='0;
                  df1[currrow].valid   <= 0;
                  df1[currrow].dirty   <= 0;
              end
          end
          if(!dcif.halt)
          begin
              if(snoopinvalid == 1 && (rdy0 || rdy1))
              begin
                  if(rdy0)
                  begin
                      df0[snoopindex].valid <= nvalid;
                  end
                  if(rdy1)
                  begin
                      df1[snoopindex].valid <= nvalid;
                  end
              end
              else if(nlast == 1 && (rdy0 || rdy1))
              begin
                  df0[index].tag <= tag;
                  if(rdy0)
                  begin
                      df0[index].data[0] <= data0;
                      df0[index].valid <= nvalid;
                      df0[index].dirty <= ndirty;
                  end
                  if(rdy1)
                  begin
                      df0[index].data[1] <= data1;
                      df0[index].valid <= nvalid;
                      df0[index].dirty <= ndirty;
                  end
              end
              //else if(cur[index] == 1 && (rdy0 || rdy1))
              else if(nlast == 2 && (rdy0 || rdy1))
              begin
                  df1[index].tag <= tag;
                  if(rdy0)
                  begin
                      df1[index].data[0] <= data0;
                      df1[index].valid <= nvalid;
                      df1[index].dirty <= ndirty;
                  end
                  if(rdy1)
                  begin
                      df1[index].data[1] <= data1;
                      df1[index].valid <= nvalid;
                      df1[index].dirty <= ndirty;
                  end
              end
              else if(available[index] == 0 && (rdy0 || rdy1))
              //else if(cur == 0 && (rdy0 || rdy1))
              begin
                  df0[index].tag <= tag;
                  if(rdy0)
                  begin
                      df0[index].data[0] <= data0;
                      df0[index].valid <= nvalid;
                      df0[index].dirty <= ndirty;
                  end
                  if(rdy1)
                  begin
                      df0[index].data[1] <= data1;
                      df0[index].valid <= nvalid;
                      df0[index].dirty <= ndirty;
                  end
              end
              else if(available[index] == 1 && (rdy0 || rdy1))
              //else if(cur == 1 && (rdy0 || rdy1))
              begin
                  df1[index].tag <= tag;
                  if(rdy0)
                  begin
                      df1[index].data[0] <= data0;
                      df1[index].valid <= nvalid;
                      df1[index].dirty <= ndirty;
                  end
                  if(rdy1)
                  begin
                      df1[index].data[1] <= data1;
                      df1[index].valid <= nvalid;
                      df1[index].dirty <= ndirty;
                  end
              end
          end
          state <= next;
          hc <= nhc;
          row <= nextrow;
          cur <= ncur;
          snoophit0 <= nsnoophit0;
          snoophit1 <= nsnoophit1;
          link <= nextlink;
          linkvalid <= nlinkvalid;
          if(next == HALT)
          begin
              isflush <= 1;
          end
	        for (i = 0; i < 8; i++)
	       	  available[i] <= next_available[i];
      end
  end
  
  
  always_comb
  begin
      currrow = row;
      next = state;
      nextrow = row;
      cif.cctrans = 0;
      case(state)
          IDLE:
          begin
              if(isflush)
              begin
                  next = HALT;
              end
              else if(dcif.halt)
              begin
                  next = DIRTY;
              end
              else if(cif.ccwait)// || cif.ccinv)
              begin
                  next = CHKSNOOP;
              end
              else if(miss)
              begin
                  if(df0[index].dirty && available[index] == 0)
                  //if(df0[index].dirty && cur == 0)
                  begin
                      next = WRITE0;
                      cif.cctrans = 0;
                  end
                  else if(df1[index].dirty && available[index] == 1)
                  //else if (df1[index].dirty && cur == 1)
                  begin
                      next = WRITE0;
                      cif.cctrans = 0;
                  end
                  else
                  begin
                      next = FETCH0;
                      cif.cctrans = 1;
                  end
                  //end
              end
          end
          WRITE0:
          begin
              if(~cif.dwait)
              begin
                  next = WRITE1;
              end
          end
          WRITE1:
          begin
              if(~cif.dwait)
              begin
                  next = FETCH0;
              end
          end
          FETCH0:
          begin
              cif.cctrans = !cif.ccwait;
              if(~cif.dwait)
              begin
                  next = FETCH1;
              end
			        if(cif.ccwait)
			        begin
			            next = CHKSNOOP;
              end
          end
          FETCH1:
          begin
              if(~cif.dwait)
              begin
                  next = IDLE;
              end
          end
          DIRTY:
          begin
              nextrow = row + 1;
              if(row < 8)
              begin
                  if(df0[row].dirty && df0[row].valid)
                  begin
                      next = FLUSH0;
                  end
                  else if(df1[row].dirty && df1[row].valid)
                  begin
                      next = FLUSH2;
                  end
              end
              else if(cif.ccwait)
			        begin
			            next = CHKSNOOP;
                  cif.cctrans = !cif.ccwait;
              end
              else if(row == 9)
              begin
                  //next = HCOUNT;
                  next = HALT;
              end
          end
          FLUSH0:
          begin
              currrow = row - 1;
              if(~cif.dwait)
              begin
                next = FLUSH1;
              end
          end
          FLUSH1:
          begin
              currrow = row - 1;
              if(~cif.dwait)
              begin
                if(currrow < 8)
                begin
                    if(df1[currrow].dirty && df1[currrow].valid)
                    begin
                        next = FLUSH2;
                    end
                    else
                    begin
                        next = DIRTY;
                    end
                end
                else
                begin
                    next = DIRTY;
                end
              end
          end
          FLUSH2:
          begin
              currrow = row - 1;
              if(~cif.dwait)
              begin
                next = FLUSH3;
              end
          end
          FLUSH3:
          begin
              currrow = row - 1;
              if(~cif.dwait)
              begin
                next = DIRTY;
              end
          end
          HCOUNT:
          begin
              //if(~cif.dwait)
              //begin
                next = HALT;
              //end
          end
          CHKSNOOP:
          begin
              if(cif.ccwait)
              begin
                  cif.cctrans = snoopdirty;
                  if(cif.cctrans)
                  begin
                      next = SEND0;
                  end
                  else
                  begin
                      next = CHKSNOOP;
                  end
                  if((nsnoophit0 || nsnoophit1) == 0)
                  begin
                      next = CHKSNOOP;
                  end
              end
              else
              begin
                  next = IDLE;
              end
          end
          SEND0:
          begin
              if(~cif.dwait)
              begin
                next = SEND1;
              end
          end
          SEND1:
          begin
              if(~cif.dwait)
              begin
                next = INV;
              end
          end
          INV:
          begin
                next = IDLE;
          end
          HALT:
          begin 
              /*if(cif.ccwait)
			        begin
			            next = CHKSNOOP;
                  cif.cctrans = !cif.ccwait;
              end
              else
              begin
                  next = IDLE;
              end*/
          end
      endcase
  end
  integer j;
  always_comb
  begin
      dcif.dhit = 0;
      dcif.dmemload = '0;
      data0 = 0;
      data1 = 0;
      cif.dREN = 0;
      cif.dWEN = 0;
      cif.daddr = 0;
      cif.dstore = 0;
      if(tag ==  df0[index].tag && available[index] == 0)
      begin
          ndirty = df0[index].dirty;
          nvalid = df0[index].valid;
      end
      else if (tag ==  df1[index].tag && available[index] == 1)
      begin
          ndirty = df1[index].dirty;
          nvalid = df1[index].valid;
      end
      else
      begin
          ndirty = 0;
          nvalid = 0;
      end
      //ndirty = 0;
      //nvalid = 0;
      //ncur = cur;
      nlast = 0;
      miss = 0;
      nhc = hc;
      rdy0 = 0;
      rdy1 = 0;
      
      if(available[index] == 0)
      begin
          snoopdirty = df0[snoopindex].dirty;
      end
      else if (available[index] == 1)
      begin
          snoopdirty = df1[snoopindex].dirty;
      end
      else
      begin
          snoopdirty = 0;
      end
      //snoopdirty = 0;
      snoopinvalid = 0;
      nsnoophit0 = snoophit0;
      nsnoophit1 = snoophit1;
      
      nextlink = link;
      nlinkvalid = linkvalid;
      
      nflushall = flushall;
      
	    for(j = 0; j < 8; j++) next_available[j] = available[j];
        case(state)
          IDLE:
          begin
              if(dcif.halt)
              begin
                  //do nothing
                  nhc = hc;
              end
              else if(dcif.dmemREN)
              begin
                  if(dcif.datomic)
                  begin
                      nextlink = dcif.dmemaddr;
                      nlinkvalid = 1;
                      dcif.dmemload = 1; // check example.asm
                      //dcif.dmemload = linkvalid && (link == dcif.dmemaddr);
                  end
                  if(df0[index].tag == tag && df0[index].valid)
                  begin
                      dcif.dmemload = df0[index].data[block];
                      dcif.dhit = 1;
                      nhc = hc + 1;
					            next_available[index] = 1;
                  end
                  else if (df1[index].tag == tag && df1[index].valid)
                  begin
                      dcif.dmemload = df1[index].data[block];
                      dcif.dhit = 1;
                      nhc = hc + 1;
					            next_available[index] = 0;
                  end
                  else 
                  begin
                      miss = 1;
                      nhc = hc - 1;
                      ndirty = 0;
                      nvalid = 1;
                      if(next_available[index] == 1)
                      begin
                          nlast = 2;
                          rdy1 = 1;
                      end
                      else
                      begin
                          nlast = 1;
                          rdy0 = 1;
                      end
                  end
              end
              else if(dcif.dmemWEN)
              begin
                  if(dcif.datomic)
                  begin
                      dcif.dmemload = linkvalid && (link == dcif.dmemaddr);
                      if(dcif.dmemaddr == link && linkvalid)
                      begin
                          //=-------------------------------------------------------------------------
                          if(df0[index].tag == tag)
                          begin
                              if(df0[index].valid && !df0[index].dirty)
                              begin
                                  miss = 1;
                                  ndirty = 1;
                                  rdy0 = 1;
			                            next_available[index] = 0;
                              end
                              else
                              begin
                                  dcif.dhit = 1;
                                  ndirty = 1;
                                  nvalid = 1;
                                  nhc = hc + 1;
                                  nlast = 1;
			                            next_available[index] = 1;
                                  if(block == 0)
                                  begin
                                      rdy0 = 1;
                                      data0 = dcif.dmemstore;
                                  end
                                  else
                                  begin
                                      rdy1 = 1;
                                      data1 = dcif.dmemstore;
                                  end
                                  nextlink = 0;
                                  nlinkvalid = 0;
                              end
                          end
                          else if(df1[index].tag == tag)
                          begin
                              if(df1[index].valid && !df1[index].dirty)
                              begin
                                  miss = 1;
                                  ndirty = 1;
                                  rdy1 = 1;
			                            next_available[index] = 1;
                              end
                              else
                              begin
                                  dcif.dhit = 1;
                                  ndirty = 1;
                                  nvalid = 1;
                                  nhc = hc + 1;
                                  nlast = 2;
			                            next_available[index] = 0;
                                  if(block == 0)
                                  begin
                                      rdy0 = 1;
                                      data0 = dcif.dmemstore;
                                  end
                                  else
                                  begin
                                      rdy1 = 1;
                                      data1 = dcif.dmemstore;
                                  end
                                  nextlink = 0;
                                  nlinkvalid = 0;
                              end
                          end
                          else
                          begin
                              miss = 1;
                              nhc = hc - 1;
                              ndirty = 0;
                              nvalid = 1;
                              if(next_available[index] == 1)
                              begin
                                  nlast = 2;
                                  rdy1 = 1;
                              end
                              else
                              begin
                                  nlast = 1;
                                  rdy0 = 1;
                              end
                          end
                          //-------------------------------------------------0----------------
                          /*if(df0[index].tag == tag)
                          begin
                              dcif.dhit = 1;
                              ndirty = 1;
                              nvalid = 1;
                              nhc = hc + 1;
                              nlast = 1;
					                    next_available[index] = 1;
                              if(block == 0)
                              begin
                                  rdy0 = 1;
                                  data0 = dcif.dmemstore;
                              end
                              else
                              begin
                                  rdy1 = 1;
                                  data1 = dcif.dmemstore;
                              end
                              nlinkvalid = 0;
                              nextlink = 0;
                          end
                          else if(df1[index].tag == tag)
                          begin
                              dcif.dhit = 1;
                              ndirty = 1;
                              nvalid = 1;
                              nhc = hc + 1;
                              nlast = 2;
					                    next_available[index] = 0;
                              if(block == 0)
                              begin
                                  rdy0 = 1;
                                  data0 = dcif.dmemstore;
                              end
                              else
                              begin
                                  rdy1 = 1;
                                  data1 = dcif.dmemstore;
                              end
                              nlinkvalid = 0;
                              nextlink = 0;
                          end
                          else 
                          begin
                              miss = 1;
                              nhc = hc - 1;
                          end */
                      end
                      else
                      begin
                          dcif.dhit = 1;
                      end
                  end
                  else
                  begin
                      if(dcif.dmemaddr == link)
                      begin
                          nextlink = 0;
                          nlinkvalid = 0;
                      end
                      if(df0[index].tag == tag)
                      begin
                          if(df0[index].valid && !df0[index].dirty)
                          begin
                              miss = 1;
                              ndirty = 1;
                              rdy0 = 1;
			                        next_available[index] = 0;
                          end
                          else
                          begin
                              dcif.dhit = 1;
                              ndirty = 1;
                              nvalid = 1;
                              nhc = hc + 1;
                              nlast = 1;
			                        next_available[index] = 1;
                              if(block == 0)
                              begin
                                  rdy0 = 1;
                                  data0 = dcif.dmemstore;
                              end
                              else
                              begin
                                  rdy1 = 1;
                                  data1 = dcif.dmemstore;
                              end
                          end
                      end
                      else if(df1[index].tag == tag)
                      begin
                          if(df1[index].valid && !df1[index].dirty)
                          begin
                              miss = 1;
                              ndirty = 1;
                              rdy1 = 1;
			                        next_available[index] = 1;
                          end
                          else
                          begin
                              dcif.dhit = 1;
                              ndirty = 1;
                              nvalid = 1;
                              nhc = hc + 1;
                              nlast = 2;
			                        next_available[index] = 0;
                              if(block == 0)
                              begin
                                  rdy0 = 1;
                                  data0 = dcif.dmemstore;
                              end
                              else
                              begin
                                  rdy1 = 1;
                                  data1 = dcif.dmemstore;
                              end
                          end
                      end
                      else
                      begin
                          miss = 1;
                          nhc = hc - 1;
                          ndirty = 0;
                          nvalid = 1;
                          if(next_available[index] == 1)
                          begin
                              nlast = 2;
                              rdy1 = 1;
                          end
                          else
                          begin
                              nlast = 1;
                              rdy0 = 1;
                          end
                      end
                      /*if(df0[index].tag == tag)
                      begin
                          dcif.dhit = 1;
                          ndirty = 1;
                          nvalid = 1;
                          nhc = hc + 1;
                          nlast = 1;
					                next_available[index] = 1;
                          if(block == 0)
                          begin
                              rdy0 = 1;
                              data0 = dcif.dmemstore;
                          end
                          else
                          begin
                              rdy1 = 1;
                              data1 = dcif.dmemstore;
                          end
                      end
                      else if(df1[index].tag == tag)
                      begin
                          dcif.dhit = 1;
                          ndirty = 1;
                          nvalid = 1;
                          nhc = hc + 1;
                          nlast = 2;
					                next_available[index] = 0;
                          if(block == 0)
                          begin
                              rdy0 = 1;
                              data0 = dcif.dmemstore;
                          end
                          else
                          begin
                              rdy1 = 1;
                              data1 = dcif.dmemstore;
                          end
                      end
                      else 
                      begin
                          miss = 1;
                          nhc = hc - 1;
                      end */
                  end
              end
          end
          WRITE0:
          begin
              cif.dWEN = 1;
              if(available[index] == 0)
              //if(cur == 0)
              begin
                  cif.dstore = df0[index].data[0];
                  cif.daddr = {df0[index].tag, index, 3'b000};
              end
              else
              begin
                  cif.dstore = df1[index].data[0];
                  cif.daddr = {df1[index].tag, index, 3'b000};
              end
          end
          WRITE1:
          begin
              cif.dWEN = 1;
              if(available[index] == 0)
              //if(cur == 0)
              begin
                  cif.dstore = df0[index].data[1];
                  cif.daddr = {df0[index].tag, index, 3'b100};
              end
              else
              begin
                  cif.dstore = df1[index].data[1];
                  cif.daddr = {df1[index].tag, index, 3'b100};
              end
          end
          FETCH0:
          begin
              rdy0 = 1;
              cif.dREN = 1;
              data0 = cif.dload;
              //nvalid = 1;
              cif.daddr = {tag, index, 3'b000};
          end
          FETCH1:
          begin
              rdy1 = 1;
              cif.dREN = 1;
              data1 = cif.dload;
              //nvalid = 1;
              cif.daddr = {tag, index, 3'b100};
          end
          DIRTY:
          begin
              nflushall = 1;
          end
          FLUSH0:
          begin
              cif.dWEN = 1;
              if(currrow < 8)
              begin
                  cif.dstore = df0[currrow].data[0];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b000};
              end
          end
          FLUSH1:
          begin
              cif.dWEN = 1;
              nlast = 1;
              if(currrow < 8)
              begin
                  cif.dstore = df0[currrow].data[1];
                  cif.daddr = {df0[currrow].tag, currrow, 3'b100};
              end
          end
          FLUSH2:
          begin
              cif.dWEN = 1;
              if(currrow < 8)
              begin
                  cif.dstore = df1[currrow].data[0];
                  cif.daddr = {df1[currrow].tag, currrow, 3'b000};
              end
          end
          FLUSH3:
          begin
              cif.dWEN = 1;
              nlast = 2;
              if(currrow < 8)
              begin
                  cif.dstore = df1[currrow].data[1];
                  cif.daddr = {df1[currrow].tag, currrow, 3'b100};
              end
          end
          HCOUNT:
          begin
              //cif.dWEN = 1;
              //cif.dstore = hc;
              //cif.daddr = 32'h00003100;
          end
          CHKSNOOP:
          begin
              nsnoophit0 = snooptag == df0[snoopindex].tag && df0[snoopindex].valid;
              nsnoophit1 = snooptag == df1[snoopindex].tag && df1[snoopindex].valid;
              if(snooptag == df0[snoopindex].tag)
              begin 
                  snoopdirty = df0[snoopindex].dirty;
              end
              if(snooptag == df1[snoopindex].tag)
              begin 
                  snoopdirty = df1[snoopindex].dirty;
              end
              if(cif.ccinv && snoopdirty == 0)
              begin
                  nvalid = 0;
                  snoopinvalid = 1;
                  if(nsnoophit1)
                  begin
                      rdy1 = 1;
                  end
                  if(nsnoophit0)
                  begin
                      rdy0 = 1;
                  end
              end
          end
          SEND0:
          begin
              if(snoophit1)
              begin
                  cif.dstore = df1[snoopindex].data[0];
                  cif.daddr = {df1[snoopindex].tag, snoopindex, 3'b000};
              end
              else
              begin
                  cif.dstore = df0[snoopindex].data[0];
                  cif.daddr = {df0[snoopindex].tag, snoopindex, 3'b000};
              end          
          end
          SEND1:
          begin
              if(snoophit1)
              begin
                  cif.dstore = df1[snoopindex].data[1];
                  cif.daddr = {df1[snoopindex].tag, snoopindex, 3'b100};
              end
              else
              begin
                  cif.dstore = df0[snoopindex].data[1];
                  cif.daddr = {df0[snoopindex].tag, snoopindex, 3'b100};
              end     
          end
          INV:
          begin
              if(cif.ccinv)
              begin
                  nvalid = 0;
                  snoopinvalid = 1;
                  if(snoophit1)
                  begin
                      rdy1 = 1;
                  end
                  if(snoophit0)
                  begin
                      rdy0 = 1;
                  end  
              end
          end
      endcase
  end

endmodule
