module fifo_asy_tb;

wire [7:0] dataout;
wire full, empty;
reg [7:0] datain;
reg rd_en,wr_en;
reg rd_clk,wr_clk,rst;


initial {rd_clk,wr_clk,rd_en,wr_en} = 0;
always #10  rd_clk = ~rd_clk;
always #5 wr_clk = ~wr_clk;


fifo_asy dut( dataout,full, empty,datain,rd_en,wr_en, rd_clk,wr_clk,rst);


task write();
integer i;
begin
    
    for(i=0 ;i<8 ;i =i+1) begin
        @(posedge wr_clk) ;
        wr_en = 1;
        datain = $random;
        $display( " %d -                     datain = %d ",i,datain);
        @(posedge wr_clk) ;
        wr_en = 0;
    end
    wr_en = 0;
end
endtask

task write_10_read_10();
integer i,j;
fork
begin   
    for(i=0 ;i<12 ;i =i+1) begin
        if(full)
            @( !full);
        @(posedge wr_clk);
        wr_en = 1;
        datain = $random;
        $display( " %d - datain = %d ",i,datain);
        @(posedge wr_clk);
        wr_en = 0;
    end
    wr_en = 0;
end
begin
    @(posedge full);
    for(j=0 ;j<12 ;j =j+1) begin
        if(empty)
            @(!empty);
        @(posedge rd_clk) ;
        rd_en = 1;
        $display( " %d -                               dataout = %d ",j,dataout);
        @(posedge rd_clk) ;
         rd_en = 0;
    end
    rd_en = 0;
end
join
endtask

 
task read();
integer i;
begin
    for(i=0 ;i<8 ;i =i+1) begin
        @(posedge rd_clk) ;
        rd_en = 1;
        $display( " %d - dataout = %d ",i,dataout);
        @(posedge rd_clk);
        rd_en = 0;
    end
    rd_en = 0;
end
endtask
       

    


    

initial begin
    rst = 1;
    #100 ;
    rst =0;

    write();
    read();
    #20;

    write();
    read();
    #20;

    write_10_read_10();
    #20;

end


initial $monitor( "............. full = %b    empty = %b    .............",full,empty);
endmodule
