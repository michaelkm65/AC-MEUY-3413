vars = 1;
input = "harmonic";
load_system("AC1P1_model.slx")
while vars < 5
    if input == "step"
        switch vars
            case 1
                m = 5; c = 100; k = 125;
            case 2
                m = 5; c = 50; k = 125;
            case 3
                m = 5; c = 10; k = 125;
            case 4
                m = 5; c = 1; k = 125;
        end
    elseif input == "harmonic"
        switch vars
            case 1
                m = 5; c = 0; k = 125; w = 1;
            case 2
                m = 5; c = 0; k = 125; w = 4.5;
            case 3
                m = 5; c = 0; k = 125; w = 5;
            case 4
                m = 5; c = 5; k = 125; w = 5;
        end
    end

    out = sim("AC1P1_model.slx");
    data = out.simout;
    x = data.Data;
    t = data.Time;
    plot(t,x);
    hold on;
    vars = vars + 1;

end

hold off; 

if input == "step"
    title('Step Response of Spring-Mass-Damper System'); 
elseif input == "harmonic"
    title('Harmonic Response of Spring-Mass-Damper System'); 
end

legend('Case 1', 'Case 2', 'Case 3', 'Case 4');
xlabel('Time'); ylabel('Position'); grid on;
close_system("AC1P1_model.slx")
