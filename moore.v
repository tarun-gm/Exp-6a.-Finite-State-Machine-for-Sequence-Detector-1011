
module moore(
    input clk,
    input rst,
    input xin,
    output reg zout
);

    parameter [2:0]
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100;

    reg [2:0] ps, ns;

    always @(posedge clk) begin
        if (rst)
            ps <= s0;
        else
            ps <= ns;
    end

    always @(*) begin 
        case (ps)

            s0: if (xin) begin
                    ns = s1;
                    zout = 0;
                end else begin
                    ns = s0;
                    zout = 0;
                end

            s1: if (xin) begin
                    ns = s1;
                    zout = 0;
                end else begin
                    ns = s2;
                    zout = 0;
                end

            s2: if (xin) begin
                    ns = s3;
                    zout = 0;
                end else begin
                    ns = s0;
                    zout = 0;
                end

            s3: if (xin) begin
                    ns = s4;
                    zout = 0;
                end else begin
                    ns = s2;
                    zout = 0;
                end

            s4: if (xin) begin
                    ns = s1;
                    zout = 1;
                end else begin
                    ns = s0;
                    zout = 1;
                end

        endcase
    end

endmodule
