module alu(
	input logic [3:0] num1,
	input logic [3:0] num2,
	input logic opcode, 
	output logic [4:0] led
	);


  localparam STATE_ALU_IDLE = 2'b0;
  localparam STATE_ALU_ADD = 2'b1;
  localparam STATE_ALU_RSHIFT = ;

	logic [4:0] adder_result;
  
	add_up adder(
		.num1(num1), 
		.num2(num2), 
		.result(adder_result)	  
				   );
					
					
	always_comb	begin
	
		case(opcode)
			1'b0:	 led = adder_result; // addition
			1'b1:  led = adder_result << 1; // left shift one 
			default: led = 5'b00000;
		endcase
		
	end
		
endmodule
