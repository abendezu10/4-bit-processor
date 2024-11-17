module alu(
	input logic [1:0] num,
  input logic [3:0] reg_in,
	input logic oper, 
  
	output logic [4:0] led
	);


	logic [4:0] adder_result;
  
	add_up adder(
		.num1(num1), 
		.num2(reg_in), 
		.result(adder_result)	  
		);

    
					
					
	always_comb	begin
	
		case(oper)
			1'b0:	 led = adder_result; // addition
			1'b1:  led = adder_result << num; // left shift one 
			default: led = 5'b00000;
		endcase
		
	end
		
endmodule
