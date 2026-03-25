vars = 1;
model = 'AC1P1_model';
block = [model '/Input Functions'];
paramName = 'SelectedSignal';
load_system(model);

input = "harmonic";    % accepts "step" or "harmonic"

while vars < 5
    if input == "step"

        set_param(block, paramName, num2str(1));
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

        set_param(block, paramName, num2str(2));
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

    out = sim(model);
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
close_system(model,0);
