module disaster_fsm (

    input        clk,
    input        reset,
    input        sample_valid,

    input  [1:0] risk_level,

    output reg [1:0] state,

    output reg buzzer,
    output reg warning_led,
    output reg critical_led
);

localparam NORMAL   = 2'b00;
localparam WARNING  = 2'b01;
localparam CRITICAL = 2'b10;


always @(posedge clk or posedge reset) begin

    if (reset) begin

        state <= NORMAL;

    end

    else if (sample_valid) begin

        case (risk_level)

            NORMAL:
                state <= NORMAL;

            WARNING:
                state <= WARNING;

            CRITICAL:
                state <= CRITICAL;

            default:
                state <= NORMAL;

        endcase

    end

end


always @(*) begin

    buzzer       = 1'b0;
    warning_led  = 1'b0;
    critical_led = 1'b0;

    case (state)

        NORMAL: begin

        end

        WARNING: begin

            warning_led = 1'b1;

        end

        CRITICAL: begin

            critical_led = 1'b1;
            buzzer       = 1'b1;

        end

        default: begin

        end

    endcase

end

endmodule