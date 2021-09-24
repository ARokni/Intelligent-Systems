function [ R_ij ] = value_func(v1,v2);
    mid=v2-v1;
    flag1=0;
    flag2=0;
    flag3=0;
    flag4=0;
    finalvect=2*ones(1,length(v1));
    I=find(mid~=0);
    if(length(I)==1)
        flag1=1;
    end
    if(flag1==1)
        if(I==1)
            flag2=1;
            flag3=1;
        end
        if(I>1)
            flag2=1;
            for count=I-1:-1:1
                if(v1(I)==v1(count))
                    flag2=0;
                end
            end
            if(flag2==1)
                 flag3=1;
                 for count=I-1:-1:1
                    if(v2(I)==v2(count))
                        flag3=0;
                    end
                 end
                 
                 
            end
        end
    end
    if((flag1==1)&&(flag2==1)&&(flag3==1))
        if((v2-finalvect)==0)
            R_ij=100;
        else
            R_ij=-0.01;
        end
       else
           R_ij=-inf;
    end
    if (mid==0)
        if((v2-finalvect)==0)
            R_ij=100;
        end
    end
    
    
    


end

