module add_op(
	 input logic [1:0] num1,
	 input logic [3:0] num2,
   output logic [4:0] result
);

  logic [3:0] in_num1;
  assign in_num1 = {2'b00, num1};

	logic cout1, cout2, cout3;

	// LSB - LED[0]
	assign result[0] = in_num1[0] ^ num2[0];
	assign cout1 = in_num1[0] & num2[0];
	
	// LED[1]
	assign result[1] = (in_num1[1] ^ num2[1]) ^ cout1;
	assign cout2 = (cout1 & (in_num1[1] ^ num2[1])) | (in_num1[1] & num2[1]);
	
	// LED[2]
	assign result[2] = (in_num1[2] ^ num2[2]) ^ cout2;
	assign cout3 = (cout2 & (in_num1[2] ^ num2[2])) | (in_num1[2] & num2[2]);
	
	// LED[3]
	assign result[3] = (in_num1[3] ^ num2[3]) ^ cout3;

  // LED Overflow
	assign result[4] = (cout3 & (in_num1[3] ^ num2[3])) | (in_num1[3] & num2[3]); // Buffer Overflow Check
	
	

   
endmodule
