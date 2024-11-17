module registers( 

  input [1:0] number,
  input reg_in,
  input oper,

  output [4:0]result
  );

  logic

  logic [3:0] reg_a0 = 4'd0;
  logic [3:0] reg_a1 = 4'd0;

  alu alu_in(
    .num(number),
    .reg_in(reg_in),
    .oper(oper),
    .led(result)
    );


 always_comb begin 
  if(reg_in == 1'd0) begin
    if(oper_in == 1'd0) begin
      reg_a0 <= reg_a0 + number;
    end else begin
      reg_a0 <= reg_a0 << number;
    end

  end else if (reg_in == 1'd1) begin

  end 
  
 end
