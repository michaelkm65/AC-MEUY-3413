vars = 1;
model = 'AC1P2_model';
block = [model '/Input Functions'];
paramName = 'SelectedSignal';
load_system(model);

m1 = 2; m2 = 5; c1 = 2; k1 = 4; k2 = 20;

while vars < 5

    switch vars
        case 1
            set_param(block, paramName, num2str(vars));

        case 2
            set_param(block, paramName, num2str(vars));

        case 3
            set_param(block, paramName, num2str(vars));

        case 4
            set_param(block, paramName, num2str(vars));

    end
    
    out = sim(model);
    data1 = out.simout1;
    data2 = out.simout2;

    x1 = data1.Data;
    x2 = data2.Data;
    t = out.tout;
    subplot(2, 2, vars)
    plot(t,x1);
    hold on;
    plot(t, x2);
    hold off;
    legend('Mass 1', 'Mass 2')
    xlabel('Time'); ylabel('Position'); grid on;
    title(compose("Case %d", vars));
    vars = vars + 1;

end

sgtitle('Responses of Spring-Mass-Damper-Spring-Mass System'); 
close_system(model, 0);