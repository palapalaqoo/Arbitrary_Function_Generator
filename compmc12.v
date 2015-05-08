
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:45 02/26/2009 
// Design Name: 
// Module Name:    compmc12 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compmc12(GT, LT, A, B);
    

   output GT;
   output LT;

   input  [11:0] A;
   input  [11:0] B;


   assign GT = A > B  ;
   assign LT = A < B  ;    


endmodule
