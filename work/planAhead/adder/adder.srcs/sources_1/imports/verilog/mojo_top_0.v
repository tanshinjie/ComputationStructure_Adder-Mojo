/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg cin,
    input s,
    input carry
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_2 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_edge_dt_out;
  reg [1-1:0] M_edge_dt_in;
  edge_detector_3 edge_dt (
    .clk(clk),
    .in(M_edge_dt_in),
    .out(M_edge_dt_out)
  );
  wire [1-1:0] M_edge_dt2_out;
  reg [1-1:0] M_edge_dt2_in;
  edge_detector_3 edge_dt2 (
    .clk(clk),
    .in(M_edge_dt2_in),
    .out(M_edge_dt2_out)
  );
  wire [1-1:0] M_clkdivider_out;
  clockdivider_5 clkdivider (
    .clk(clk),
    .rst(rst),
    .out(M_clkdivider_out)
  );
  wire [8-1:0] M_adderfsm_out;
  wire [7-1:0] M_adderfsm_io;
  reg [1-1:0] M_adderfsm_clkrise;
  reg [1-1:0] M_adderfsm_in;
  reg [2-1:0] M_adderfsm_result;
  adder_6 adderfsm (
    .clk(clk),
    .rst(rst),
    .clkrise(M_adderfsm_clkrise),
    .in(M_adderfsm_in),
    .result(M_adderfsm_result),
    .out(M_adderfsm_out),
    .io(M_adderfsm_io)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_btn_cond_in = io_button[4+0-:1];
    M_edge_dt2_in = M_btn_cond_out;
    M_edge_dt_in = M_clkdivider_out;
    M_adderfsm_clkrise = M_edge_dt_out;
    M_adderfsm_in = M_edge_dt2_out;
    M_adderfsm_result = {carry, s};
    io_led[8+7-:8] = M_adderfsm_out;
    a = M_adderfsm_out[0+0-:1];
    b = M_adderfsm_out[1+0-:1];
    cin = M_adderfsm_out[2+0-:1];
    io_sel = 4'he;
    io_seg = ~M_adderfsm_io;
  end
endmodule
