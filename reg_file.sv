module reg_file( 
  input clk,
  input rst,
  input [1:0] number,
  input reg_in,
  input oper,

  output [4:0]result
  );

  logic [4:0] alu_result;

  logic [3:0] reg_a0;
  logic [3:0] reg_a1;

  alu alu_in(
    .num(number),
    .reg_in((reg_in) ? reg_a1: reg_a0),
    .oper(oper),
    .led(alu_result)
    );


  always_ff @ (posedge clk or negedge rst) begin
    if(!rst) begin
      reg_a0 <= 4'd0;
      reg_a1 <= 4'd0;
    end else begin
      case (reg_in) 
        1'd0: begin
          reg_a0 <= alu_result[3:0];
        end
        1'd1: begin
          reg_a1 <= alu_result[3:0];
        end
      endcase
      
    end
  end

  always_comb begin
  case (reg_in)
    1'd0: begin       
      result = alu_result;
    end
    1'd1: begin
      result = alu_result; 
    end
    default : begin
      result = 5'd0;
    end
  endcase

  end
endmodule
