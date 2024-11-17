module instr_mem (
  input logic [3:0] instr_addr,

  output logic [3:0] data_o  
  );

   logic [3:0] memory [0:15];  

  initial begin
    $readmemb("machine_code.bin", memory);
  end


  always_comb begin 
    data_o <= memory[instr_addr]
  end
endmodule

