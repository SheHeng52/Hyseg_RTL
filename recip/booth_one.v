`timescale 1ns / 1ps

module booth_one (
    input  [18:0]  k,      
    input  [19:0]  x,      
    output reg [230:0] pd,
    output reg [9:0]   neg
);

    wire [21:0] x1;
    wire [21:0] xn1;
    wire [21:0] x2;
    wire [21:0] xn2;

    assign x1  = {2'b0, x};        // +x
    assign xn1 = ~x1;             // ~x
    assign x2  = {1'b0, x, 1'b0};  // +2x
    assign xn2 = ~x2;             // ~2x


//    booth_pp0 u_booth_pp0 (.code(k[1:0]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[23:0]), .neg(neg[0]) );
//    booth_pp  u_booth_pp1 (.code(k[3:1]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[46:24]),.neg(neg[1]) );
//    booth_pp  u_booth_pp2 (.code(k[5:3]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[69:47]),.neg(neg[2]) );
//    booth_pp  u_booth_pp3 (.code(k[7:5]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[92:70]),.neg(neg[3]) );
//    booth_pp  u_booth_pp4 (.code(k[9:7]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[115:93]),.neg(neg[4]) );
//    booth_pp  u_booth_pp5 (.code(k[11:9]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[138:116]),.neg(neg[5]) );
//    booth_pp  u_booth_pp6 (.code(k[13:11]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[161:139]),.neg(neg[6]) );
//    booth_pp  u_booth_pp7 (.code(k[15:13]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[184:162]),.neg(neg[7]) );
//    booth_pp  u_booth_pp8 (.code(k[17:15]),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[207:185]),.neg(neg[8]) );
//    booth_pp  u_booth_pp9 (.code({1'b0, k[18], k[17]}),  .x1(x_1),  .xn1(x_n1),  .x2(x_2),  .xn2(x_n2),  .pp(pd[230:208]),.neg(neg[9]) );


    always@*
	    begin	
	       case(k[1:0]) 
		   2'b00  : begin  pd[23:0] <= {1'b1, 1'b0, 1'b0, 21'b0};            neg[0] <= 1'b0;end		   
		   2'b01  : begin  pd[23:0] <= {~x1[21],x1[21],x1[21],x1[20:0]};     neg[0] <= 1'b0;end
		   2'b10  : begin  pd[23:0] <= {~xn2[21],xn2[21],xn2[21],xn2[20:0]}; neg[0] <= 1'b1;end 
		   2'b11  : begin  pd[23:0] <= {~xn1[21],xn1[21],xn1[21],xn1[20:0]}; neg[0] <= 1'b1;end
		   default: begin  pd[23:0] <= 24'b0;                                neg[0] <= 1'b0;end
		   endcase 
		   
		   case(k[3:1]) 
		   3'b000  : begin  pd[46:24]  <= {1'b1, 1'b1, 21'b0};               neg[1] <= 1'b0;end		   
		   3'b001  : begin  pd[46:24]  <= {1'b1, ~x1[21],x1[20:0]};          neg[1] <= 1'b0;end
		   3'b010  : begin  pd[46:24]  <= {1'b1, ~x1[21],x1[20:0]};          neg[1] <= 1'b0;end
		   3'b011  : begin  pd[46:24]  <= {1'b1, ~x2[21],x2[20:0]};          neg[1] <= 1'b0;end
		   3'b100  : begin  pd[46:24]  <= {1'b1, ~xn2[21],xn2[20:0]};      	 neg[1] <= 1'b1;end
		   3'b101  : begin  pd[46:24]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[1] <= 1'b1;end
		   3'b110  : begin  pd[46:24]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[1] <= 1'b1;end
		   3'b111  : begin  pd[46:24]  <= {1'b1, 1'b1, 21'b0};          	 neg[1] <= 1'b0;end
		   default:  begin  pd[46:24]  <= 23'b0;         		             neg[1] <= 1'b0;end
		   endcase
		   
		   case(k[5:3]) 
		   3'b000  : begin  pd[69:47]  <= {1'b1, 1'b1, 21'b0};               neg[2] <= 1'b0;end		   
		   3'b001  : begin  pd[69:47]  <= {1'b1, ~x1[21],x1[20:0]};          neg[2] <= 1'b0;end
		   3'b010  : begin  pd[69:47]  <= {1'b1, ~x1[21],x1[20:0]};          neg[2] <= 1'b0;end
		   3'b011  : begin  pd[69:47]  <= {1'b1, ~x2[21],x2[20:0]};          neg[2] <= 1'b0;end
		   3'b100  : begin  pd[69:47]  <= {1'b1, ~xn2[21],xn2[20:0]};      	 neg[2] <= 1'b1;end
		   3'b101  : begin  pd[69:47]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[2] <= 1'b1;end
		   3'b110  : begin  pd[69:47]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[2] <= 1'b1;end
		   3'b111  : begin  pd[69:47]  <= {1'b1, 1'b1, 21'b0};          	 neg[2] <= 1'b0;end
		   default:  begin  pd[69:47]  <= 23'b0;         		             neg[2] <= 1'b0;end
		   endcase 
		   
		   case(k[7:5]) 
		   3'b000  : begin  pd[92:70]  <= {1'b1, 1'b1, 21'b0};               neg[3] <= 1'b0;end		   
		   3'b001  : begin  pd[92:70]  <= {1'b1, ~x1[21],x1[20:0]};          neg[3] <= 1'b0;end
		   3'b010  : begin  pd[92:70]  <= {1'b1, ~x1[21],x1[20:0]};          neg[3] <= 1'b0;end
		   3'b011  : begin  pd[92:70]  <= {1'b1, ~x2[21],x2[20:0]};          neg[3] <= 1'b0;end
		   3'b100  : begin  pd[92:70]  <= {1'b1, ~xn2[21],xn2[20:0]};      	 neg[3] <= 1'b1;end
		   3'b101  : begin  pd[92:70]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[3] <= 1'b1;end
		   3'b110  : begin  pd[92:70]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[3] <= 1'b1;end
		   3'b111  : begin  pd[92:70]  <= {1'b1, 1'b1, 21'b0};          	 neg[3] <= 1'b0;end
		   default:  begin  pd[92:70]  <= 23'b0;         		             neg[3] <= 1'b0;end
		   endcase  
		   
		   case(k[9:7]) 
		   3'b000  : begin  pd[115:93]  <= {1'b1, 1'b1, 21'b0};               neg[4] <= 1'b0;end		   
		   3'b001  : begin  pd[115:93]  <= {1'b1, ~x1[21],x1[20:0]};          neg[4] <= 1'b0;end
		   3'b010  : begin  pd[115:93]  <= {1'b1, ~x1[21],x1[20:0]};          neg[4] <= 1'b0;end
		   3'b011  : begin  pd[115:93]  <= {1'b1, ~x2[21],x2[20:0]};          neg[4] <= 1'b0;end
		   3'b100  : begin  pd[115:93]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[4] <= 1'b1;end
		   3'b101  : begin  pd[115:93]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[4] <= 1'b1;end
		   3'b110  : begin  pd[115:93]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[4] <= 1'b1;end
		   3'b111  : begin  pd[115:93]  <= {1'b1, 1'b1, 21'b0};          	  neg[4] <= 1'b0;end
		   default:  begin  pd[115:93]  <= 23'b0;         		              neg[4] <= 1'b0;end
		   endcase   
		   
		   case(k[11:9]) 
		   3'b000  : begin  pd[138:116]  <= {1'b1, 1'b1, 21'b0};               neg[5] <= 1'b0;end		   
		   3'b001  : begin  pd[138:116]  <= {1'b1, ~x1[21],x1[20:0]};          neg[5] <= 1'b0;end
		   3'b010  : begin  pd[138:116]  <= {1'b1, ~x1[21],x1[20:0]};          neg[5] <= 1'b0;end
		   3'b011  : begin  pd[138:116]  <= {1'b1, ~x2[21],x2[20:0]};          neg[5] <= 1'b0;end
		   3'b100  : begin  pd[138:116]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[5] <= 1'b1;end
		   3'b101  : begin  pd[138:116]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[5] <= 1'b1;end
		   3'b110  : begin  pd[138:116]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[5] <= 1'b1;end
		   3'b111  : begin  pd[138:116]  <= {1'b1, 1'b1, 21'b0};          	   neg[5] <= 1'b0;end
		   default:  begin  pd[138:116]  <= 23'b0;         		               neg[5] <= 1'b0;end
		   endcase 
		   
		   case(k[13:11]) 
		   3'b000  : begin  pd[161:139]  <= {1'b1, 1'b1, 21'b0};               neg[6] <= 1'b0;end		   
		   3'b001  : begin  pd[161:139]  <= {1'b1, ~x1[21],x1[20:0]};          neg[6] <= 1'b0;end
		   3'b010  : begin  pd[161:139]  <= {1'b1, ~x1[21],x1[20:0]};          neg[6] <= 1'b0;end
		   3'b011  : begin  pd[161:139]  <= {1'b1, ~x2[21],x2[20:0]};          neg[6] <= 1'b0;end
		   3'b100  : begin  pd[161:139]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[6] <= 1'b1;end
		   3'b101  : begin  pd[161:139]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[6] <= 1'b1;end
		   3'b110  : begin  pd[161:139]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[6] <= 1'b1;end
		   3'b111  : begin  pd[161:139]  <= {1'b1, 1'b1, 21'b0};          	   neg[6] <= 1'b0;end
		   default:  begin  pd[161:139]  <= 23'b0;         		               neg[6] <= 1'b0;end
		   endcase 
		   
		   case(k[15:13]) 
		   3'b000  : begin  pd[184:162]  <= {1'b1, 1'b1, 21'b0};               neg[7] <= 1'b0;end		   
		   3'b001  : begin  pd[184:162]  <= {1'b1, ~x1[21],x1[20:0]};          neg[7] <= 1'b0;end
		   3'b010  : begin  pd[184:162]  <= {1'b1, ~x1[21],x1[20:0]};          neg[7] <= 1'b0;end
		   3'b011  : begin  pd[184:162]  <= {1'b1, ~x2[21],x2[20:0]};          neg[7] <= 1'b0;end
		   3'b100  : begin  pd[184:162]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[7] <= 1'b1;end
		   3'b101  : begin  pd[184:162]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[7] <= 1'b1;end
		   3'b110  : begin  pd[184:162]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[7] <= 1'b1;end
		   3'b111  : begin  pd[184:162]  <= {1'b1, 1'b1, 21'b0};          	   neg[7] <= 1'b0;end
		   default:  begin  pd[184:162]  <= 23'b0;         		               neg[7] <= 1'b0;end
		   endcase  
		   
		   case(k[17:15]) 
		   3'b000  : begin  pd[207:185]  <= {1'b1, 1'b1, 21'b0};               neg[8] <= 1'b0;end		   
		   3'b001  : begin  pd[207:185]  <= {1'b1, ~x1[21],x1[20:0]};          neg[8] <= 1'b0;end
		   3'b010  : begin  pd[207:185]  <= {1'b1, ~x1[21],x1[20:0]};          neg[8] <= 1'b0;end
		   3'b011  : begin  pd[207:185]  <= {1'b1, ~x2[21],x2[20:0]};          neg[8] <= 1'b0;end
		   3'b100  : begin  pd[207:185]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[8] <= 1'b1;end
		   3'b101  : begin  pd[207:185]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[8] <= 1'b1;end
		   3'b110  : begin  pd[207:185]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[8] <= 1'b1;end
		   3'b111  : begin  pd[207:185]  <= {1'b1, 1'b1, 21'b0};          	   neg[8] <= 1'b0;end
		   default:  begin  pd[207:185]  <= 23'b0;         		               neg[8] <= 1'b0;end
		   endcase  
		   
		   case({1'b0,k[18],k[17]}) 
		   3'b000  : begin  pd[230:208]  <= {1'b1, 1'b1, 21'b0};               neg[9] <= 1'b0;end		   
		   3'b001  : begin  pd[230:208]  <= {1'b1, ~x1[21],x1[20:0]};          neg[9] <= 1'b0;end
		   3'b010  : begin  pd[230:208]  <= {1'b1, ~x1[21],x1[20:0]};          neg[9] <= 1'b0;end
		   3'b011  : begin  pd[230:208]  <= {1'b1, ~x2[21],x2[20:0]};          neg[9] <= 1'b0;end
		   3'b100  : begin  pd[230:208]  <= {1'b1, ~xn2[21],xn2[20:0]};        neg[9] <= 1'b1;end
		   3'b101  : begin  pd[230:208]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[9] <= 1'b1;end
		   3'b110  : begin  pd[230:208]  <= {1'b1, ~xn1[21],xn1[20:0]};        neg[9] <= 1'b1;end
		   3'b111  : begin  pd[230:208]  <= {1'b1, 1'b1, 21'b0};          	   neg[9] <= 1'b0;end
		   default:  begin  pd[230:208]  <= 23'b0;         		               neg[9] <= 1'b0;end
		   endcase                                      
     end






//    function [23:0] booth_pp0;
//        input [1:0]  code;
//        input [21:0] x1;
//        input [21:0] xn1;
//        input [21:0] x2;
//        input [21:0] xn2;
//        begin
//            case (code)
//                2'b00: booth_pp0 = {1'b1, 1'b0, 1'b0, 21'b0};
//                2'b01: booth_pp0 = {~x1[21],  x1[21],  x1[21],  x1[20:0]};
//                2'b10: booth_pp0 = {~xn2[21], xn2[21], xn2[21], xn2[20:0]};
//                2'b11: booth_pp0 = {~xn1[21], xn1[21], xn1[21], xn1[20:0]};
//                default: booth_pp0 = 24'b0;
//            endcase
//        end
//    endfunction

//    function [22:0] booth_pp;
//        input [2:0]  code;
//        input [21:0] x1;
//        input [21:0] xn1;
//        input [21:0] x2;
//        input [21:0] xn2;
//        begin
//            case (code)
//                3'b000: booth_pp = {1'b1, 1'b1, 21'b0};
//                3'b001: booth_pp = {1'b1, ~x1[21],  x1[20:0]};
//                3'b010: booth_pp = {1'b1, ~x1[21],  x1[20:0]};
//                3'b011: booth_pp = {1'b1, ~x2[21],  x2[20:0]};
//                3'b100: booth_pp = {1'b1, ~xn2[21], xn2[20:0]};
//                3'b101: booth_pp = {1'b1, ~xn1[21], xn1[20:0]};
//                3'b110: booth_pp = {1'b1, ~xn1[21], xn1[20:0]};
//                3'b111: booth_pp = {1'b1, 1'b1, 21'b0};
//                default: booth_pp = 23'b0;
//            endcase
//        end
//    endfunction

//    function booth_neg0;
//        input [1:0] code;
//        begin
//            case (code)
//                2'b10: booth_neg0 = 1'b1;
//                2'b11: booth_neg0 = 1'b1;
//                default: booth_neg0 = 1'b0;
//            endcase
//        end
//    endfunction

//    function booth_neg;
//        input [2:0] code;
//        begin
//            case (code)
//                3'b100: booth_neg = 1'b1;
//                3'b101: booth_neg = 1'b1;
//                3'b110: booth_neg = 1'b1;
//                default: booth_neg = 1'b0;
//            endcase
//        end
//    endfunction

//    always @* begin
//        pd[23:0]    = booth_pp0(k[1:0], x_1, x_n1, x_2, x_n2);
//        neg[0]      = booth_neg0(k[1:0]);
    
//        pd[46:24]   = booth_pp(k[3:1], x_1, x_n1, x_2, x_n2);
//        neg[1]      = booth_neg(k[3:1]);
    
//        pd[69:47]   = booth_pp(k[5:3], x_1, x_n1, x_2, x_n2);
//        neg[2]      = booth_neg(k[5:3]);
    
//        pd[92:70]   = booth_pp(k[7:5], x_1, x_n1, x_2, x_n2);
//        neg[3]      = booth_neg(k[7:5]);
    
//        pd[115:93]  = booth_pp(k[9:7], x_1, x_n1, x_2, x_n2);
//        neg[4]      = booth_neg(k[9:7]);
    
//        pd[138:116] = booth_pp(k[11:9], x_1, x_n1, x_2, x_n2);
//        neg[5]      = booth_neg(k[11:9]);
    
//        pd[161:139] = booth_pp(k[13:11], x_1, x_n1, x_2, x_n2);
//        neg[6]      = booth_neg(k[13:11]);
    
//        pd[184:162] = booth_pp(k[15:13], x_1, x_n1, x_2, x_n2);
//        neg[7]      = booth_neg(k[15:13]);
    
//        pd[207:185] = booth_pp(k[17:15], x_1, x_n1, x_2, x_n2);
//        neg[8]      = booth_neg(k[17:15]);
    
//        // 关键：19-bit signed k 的最高 Booth 组需要符号扩展
//        pd[230:208] = booth_pp({1'b0, k[18], k[17]}, x_1, x_n1, x_2, x_n2);
//        neg[9]      = booth_neg({1'b0, k[18], k[17]});
//    end

 
endmodule
