clear all
close all
clc

load iris;
k=51;        %number of clusters
cc=randi(150,[k,1]); %initializition of centroids
       c1=0;
       c2=0;
       c3=0;
 for i=1:1:k
    c(i,:)=data(cc(i),:);
end
 cluster_cell=cell(k,1);
 for it=1:1:150     %clustering by itereation of 150(and 150 data)
   clus_size=zeros(k,1); 
    Avg_cent=zeros(k,4);
   for i=1:1:150
    u=Neares_center( c,data(i),k);
    for z=1:1:k
            if(u==z)
                clus_size(z)=clus_size(z)+1;                
                Avg_cent(z,:)=data(i,:)+Avg_cent(z,:);
                mid=cell2mat(cluster_cell(z,1));
                mid(clus_size(z),:)=data(i,:);
                cluster_cell{z,1}=mid;
                        %dar vaghe dar har class be tedade cl
            end
        end
   end
   
   for i2=1:1:k                %calculate new center
       if(clus_size(i2)>0) 
       c(i2)=Avg_cent(i2)/clus_size(i2);
       else
           c(i2)=c(i2);
       end
  end
 end
 distance=0;
 
  clus_size2=zeros(k,1); 
 cluster_cell2=cell(k,1);
 for i=1:1:150
    u=Neares_center( c,data(i),k);
    for z=1:1:k
            if(u==z)
                clus_size2(z)=clus_size2(z)+1;                
                Avg_cent(z,:)=data(i,:)+Avg_cent(z,:);
                mid=cell2mat(cluster_cell2(z,1));
                mid(clus_size2(z),:)=data(i,:);
                cluster_cell2{z,1}=mid;
                        %We have c1 differnt classes
            end
        end
   end
 
 
 
 
 
 
 
 
 
 
 
 for j=1:1:k
    dmid=cell2mat(cluster_cell2(j,1));
    distance=In_out_distance( dmid)+distance;
 
 end
 
 
 