
module fifo_asy( output [7:0] dataout,
					output full, empty,
						input [7:0] datain,
						input rd_clk,wr_clk,rst);

reg [3:0] rd_pointer, rd_sync_1,rd_sync_2;
reg [3:0] wr_pointer, wr_sync_1,wr_sync_2;

reg [7:0] mem [7:0] ;

wire [3:0] rd_pointer_sync,wr_pointer_sync,rd_pointer_g,wr_pointer_g;


always @(posedge wr_clk or posedge rst) begin
	if(rst) 
		wr_pointer <= 0;
	else if(!full) begin
			wr_pointer <= wr_pointer + 1;
			mem[wr_pointer[2:0]] <= datain;
		end
end

always @(posedge rd_clk or posedge rst) begin
	if(rst)
		rd_pointer <= 0;
	else if(!empty)
		rd_pointer <= rd_pointer  + 1;
end


always @(posedge rd_clk) begin
	wr_sync_1 <= wr_pointer_g;
	wr_sync_2 <= wr_sync_1;
end

always @(posedge wr_clk) begin
	rd_sync_1 <= rd_pointer_g;
 	rd_sync_2 <= rd_sync_1;
end


	assign full = ((wr_pointer[3]!=rd_pointer_sync[3]) && (wr_pointer[2:0]== rd_pointer_sync[2:0]))?1:0;
assign empty = (wr_pointer_sync == rd_pointer)?1:0;

assign dataout = mem [ rd_pointer[2:0]];

assign wr_pointer_g =  wr_pointer^(wr_pointer >> 1);
assign rd_pointer_g =  rd_pointer^(rd_pointer >> 1);

assign wr_pointer_sync = wr_sync_2 ^ ( wr_sync_2 >> 1) ^ ( wr_sync_2 >> 2) ^ ( wr_sync_2 >> 3);
assign rd_pointer_sync = rd_sync_2 ^ ( rd_sync_2 >> 1) ^ ( rd_sync_2 >> 2) ^ ( rd_sync_2 >> 3);

endmodule
