/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
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
    output reg a,
    output reg b,
    output reg c_in,
    input sum,
    input carryIn
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam S000_state = 4'd0;
  localparam S001_state = 4'd1;
  localparam S010_state = 4'd2;
  localparam S011_state = 4'd3;
  localparam S100_state = 4'd4;
  localparam S101_state = 4'd5;
  localparam S110_state = 4'd6;
  localparam S111_state = 4'd7;
  localparam ERROR_state = 4'd8;
  
  reg [3:0] M_state_d, M_state_q = S000_state;
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_counter_d = 1'h0;
    a = M_counter_q[27+0-:1];
    b = M_counter_q[26+0-:1];
    c_in = M_counter_q[25+0-:1];
    M_counter_d = M_counter_q + 1'h1;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    
    case (M_state_q)
      S000_state: begin
        io_led = {8'h00, 8'h00, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h0 && M_counter_q[26+0-:1] == 1'h0 && M_counter_q[25+0-:1] == 1'h0) begin
          if (carryIn == 1'h0 && sum == 1'h0) begin
            M_state_d = S001_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      S001_state: begin
        io_led = {8'h01, 8'h01, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h0 && M_counter_q[26+0-:1] == 1'h0 && M_counter_q[25+0-:1] == 1'h1) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h0 && sum == 1'h1) begin
              M_state_d = S010_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S010_state: begin
        io_led = {8'h02, 8'h02, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h0 && M_counter_q[26+0-:1] == 1'h1 && M_counter_q[25+0-:1] == 1'h0) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h0 && sum == 1'h1) begin
              M_state_d = S011_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S011_state: begin
        io_led = {8'h03, 8'h03, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h0 && M_counter_q[26+0-:1] == 1'h1 && M_counter_q[25+0-:1] == 1'h1) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h1 && sum == 1'h0) begin
              M_state_d = S100_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S100_state: begin
        io_led = {8'h04, 8'h04, {5'h00, M_counter_q[29+0-:1], M_counter_q[28+0-:1], M_counter_q[27+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h1 && M_counter_q[26+0-:1] == 1'h0 && M_counter_q[25+0-:1] == 1'h0) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h0 && sum == 1'h1) begin
              M_state_d = S101_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S101_state: begin
        io_led = {8'h05, 8'h05, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h1 && M_counter_q[26+0-:1] == 1'h0 && M_counter_q[25+0-:1] == 1'h1) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h1 && sum == 1'h0) begin
              M_state_d = S110_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S110_state: begin
        io_led = {8'h06, 8'h06, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h1 && M_counter_q[26+0-:1] == 1'h1 && M_counter_q[25+0-:1] == 1'h0) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h1 && sum == 1'h0) begin
              M_state_d = S111_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      S111_state: begin
        io_led = {8'h07, 8'h07, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h1 && M_counter_q[26+0-:1] == 1'h1 && M_counter_q[25+0-:1] == 1'h1) begin
          if (M_counter_q[24+0-:1] == 1'h1) begin
            if (carryIn == 1'h1 && sum == 1'h1) begin
              M_state_d = S000_state;
            end else begin
              M_state_d = ERROR_state;
            end
          end
        end
      end
      ERROR_state: begin
        io_led = {{4'h8{M_counter_q[22+0-:1]}}, {4'h8{M_counter_q[22+0-:1]}}, {5'h00, M_counter_q[27+0-:1], M_counter_q[26+0-:1], M_counter_q[25+0-:1]}};
        if (M_counter_q[27+0-:1] == 1'h0 && M_counter_q[26+0-:1] == 1'h0 && M_counter_q[25+0-:1] == 1'h0) begin
          M_state_d = S000_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
