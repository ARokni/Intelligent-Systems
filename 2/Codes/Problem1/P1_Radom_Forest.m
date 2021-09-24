clear all
close all
clc
kk=4;
load letter_recognition;
class_data1=ones(1,4000);
 class_data2=ones(1,4000)+ones(1,4000);
 class_data3=ones(1,4000)+ones(1,4000)+ones(1,4000);
 class_data4=ones(1,4000)+ones(1,4000)+ones(1,4000)+ones(1,4000);
class_data=ones(1,4000);
%forest_cell=cell(kk,1);
for r=1:1:26
for i=1:1:16000
    if(train_labels(i)==r)  %in test fagaht baraye harfe avale englisi hast
        labels(i)=1;
    else
        labels(i)=0;
    end
end
labels2=transpose(labels);
examples=[train_data labels2];



    for n=1:1:16/4
        examples11(:,n)=examples(:,n);
    end
        examples1=[examples11 labels2];
    for n=1:1:16/4
        examples22(:,n)=examples(:,n+4);
    end
        examples2=[examples22 labels2];
    for n=1:1:16/4
        examples33(:,n)=examples(:,n+8);
    end
        examples3=[examples33 labels2];
    for n=1:1:16/4
        examples44(:,n)=examples(:,n+12);
    end
        examples4=[examples44 labels2];
instance=[test_data,test_labels];
   % for n=1:1:16/4
   %     instance1(:,n)=instance(:,n);
   % end
   % for n=1:1:16/4
    %    instance2(:,n)=instance(:,n+4);
    %end
   % for n=1:1:16/4
    %    instance3(:,n)=instance(:,n+8);
   % end
   % for n=1:1:16/4
   %     instance4(:,n)=instance(:,n+12);
    %end
    

%r=1;

%here we must devide into k groups oh no...you must do that at the top of
%line 6 



activeAttributes=ones(1,16/kk);
    my_cell1=cell(4,1);
    my_cell1{1,1}='0';
    my_cell1{2,1}='1';
    my_cell1{3,1}='2';
    my_cell1{4,1}='3';
    [tree1] = ID3(examples1, my_cell1, activeAttributes);
    my_cell2=cell(4,1);
    my_cell2{1,1}='4';
    my_cell2{2,1}='5';
    my_cell2{3,1}='6';
    my_cell2{4,1}='7';
    [tree2] = ID3(examples2, my_cell2, activeAttributes);
    my_cell3=cell(4,1);
    my_cell3{1,1}='8';
    my_cell3{2,1}='9';
    my_cell3{3,1}='10';
    my_cell3{4,1}='11';
    [tree3] = ID3(examples3, my_cell3, activeAttributes);
     my_cell4=cell(4,1);
    my_cell4{1,1}='12';
    my_cell4{2,1}='13';
    my_cell4{3,1}='14';
    my_cell4{4,1}='15';
    [tree4] = ID3(examples4, my_cell4, activeAttributes);
    

for i=1:1:4000
    instance11=instance(i,:);
    classifications1(i,:) = ClassifyByTree(tree1,my_cell1, instance11);
end

for i=1:1:4000
    instance22=instance(i,:);
    classifications2(i,:) = ClassifyByTree(tree2,my_cell2, instance22);
end

for i=1:1:4000
    instance33=instance(i,:);
    classifications3(i,:) = ClassifyByTree(tree3,my_cell3, instance33);
end

for i=1:1:4000
    instance44=instance(i,:);
    classifications4(i,:) = ClassifyByTree(tree4,my_cell4, instance44);
end



% classifications
 
I1=find(classifications1(:,1)==1);
for n=1:1:length(I1)
    class_data1(I1(n))=r;
end
class1=transpose(class_data1);
I2=find(classifications2(:,1)==1);
for n=1:1:length(I2)
    class_data2(I2(n))=r;
end
class2=transpose(class_data2);
I3=find(classifications3(:,1)==1);
for n=1:1:length(I3)
    class_data3(I3(n))=r;
end
class3=transpose(class_data3);
I4=find(classifications4(:,1)==1);
for n=1:1:length(I4)
    class_data4(I4(n))=r;
end
class4=transpose(class_data4);

end

class_total=[class1,class2,class3,class4];

% now we must vote:
for i=1:1:4000
    final_class(i)=mode(class_total(i,:));
end
final_cl=transpose(final_class);
cl=final_cl-test_labels;
u=find(cl==0);