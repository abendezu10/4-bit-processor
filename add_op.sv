module add_op(
	 input logic [3:0] num1,
	 input logic [3:0] num2,
    output logic [4:0] result
);


	logic cout1, cout2, cout3;
	logic [26:0] counter = 0;
	
	// LSB - LED[0]
	assign result[0] = num1[0] ^ num2[0];
	assign cout1 = num1[0] & num2[0];
	
	// LED[1]
	assign result[1] = (num1[1] ^ num2[1]) ^ cout1;
	assign cout2 = (cout1 & (num1[1] ^ num2[1])) | (num1[1] & num2[1]);
	
	// LED[2]
	assign result[2] = (num1[2] ^ num2[2]) ^ cout2;
	assign cout3 = (cout2 & (num1[2] ^ num2[2])) | (num1[2] & num2[2]);
	
	// LED[3]
	assign result[3] = (num1[3] ^ num2[3]) ^ cout3;
	assign result[4] = (cout3 & (num1[3] ^ num2[3])) | (num1[3] & num2[3]); // Buffer Overflow Check
	
	

   
endmodule
