function [Probabilty_healthy,Probabilty_sick] = Probabilty_bayes( test,healthy_mid,healthy_varn,healthy_prior,sick_mid,sick_varn,sick_prior )
    %normal_dist for every healthy attr
    for i=1:1:5
        p_healthy(i)=(1/(sqrt(2*pi*healthy_varn(i)*healthy_varn(i))))*exp(-1*(((test(i)-healthy_mid(i))^2)/(2*healthy_varn(i)^2)));
    end
        %total prob for healthy
    Probabilty_healthy=healthy_prior*p_healthy(1)*p_healthy(2)*p_healthy(3)*p_healthy(4)*p_healthy(5);
     
    for i=1:1:5
        p_sick(i)=(1/(sqrt(2*pi*sick_varn(i)*sick_varn(i))))*exp(-1*(((test(i)-sick_mid(i))^2)/(2*(sick_varn(i)^2))));
    end
        %total prob for healthy
    Probabilty_sick=sick_prior*p_sick(1)*p_sick(2)*p_sick(3)*p_sick(4)*p_sick(5);
     
     


end

