`timescale 1ns/1ns
module FWRD (sel_src1_FWRD, sel_src2_FWRD, src1_EXE, src2_EXE, dest_MEM, dest_WB, WB_EN_MEM, WB_EN_WB);
  
  output reg [1:0] sel_src1_FWRD, sel_src2_FWRD;
  input [4:0] src1_EXE, src2_EXE, dest_MEM, dest_WB;
  input WB_EN_MEM, WB_EN_WB;
  
  always@(src1_EXE, dest_MEM, dest_WB, WB_EN_MEM, WB_EN_WB)begin
    if(WB_EN_MEM &(dest_MEM==src1_EXE)) sel_src1_FWRD = 2'd2;
    else if(WB_EN_WB &(dest_WB==src1_EXE)) sel_src1_FWRD = 2'd1;
    else sel_src1_FWRD = 2'd0;
  end

  always@(src2_EXE, dest_MEM, dest_WB, WB_EN_MEM, WB_EN_WB)begin
    if(WB_EN_MEM &(dest_MEM==src2_EXE)) sel_src2_FWRD = 2'd2;
    else if(WB_EN_WB &(dest_WB==src2_EXE)) sel_src2_FWRD = 2'd1;
    else sel_src2_FWRD = 2'd0;
  end
  
endmodule