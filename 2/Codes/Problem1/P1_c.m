clear all
close all
clc
load letter_recognition;
class_data=ones(1,4000);
for r=1:1:26
for i=1:1:16000
    if(train_labels(i)==r)  
        labels(i)=1;
    else
        labels(i)=0;
    end
end
labels2=transpose(labels);
examples=[train_data labels2];
activeAttributes=ones(1,16);
my_cell=cell(16,1);
my_cell{1,1}='0';
my_cell{2,1}='1';
my_cell{3,1}='2';
my_cell{4,1}='3';
my_cell{5,1}='4';
my_cell{6,1}='5';
my_cell{7,1}='6';
my_cell{8,1}='7';
my_cell{9,1}='8';
my_cell{10,1}='9';
my_cell{11,1}='10';
my_cell{12,1}='11';
my_cell{13,1}='12';
my_cell{14,1}='13';
my_cell{15,1}='14';
my_cell{16,1}='15';
[tree] = P1c_ID3(examples, my_cell, activeAttributes);
for i=1:1:4000
instance2=[test_data,test_labels];
instance=instance2(i,:);
classifications(i,:) = ClassifyByTree(tree,my_cell, instance);

end
I=find(classifications(:,1)==1);
for n=1:1:length(I)
    class_data(I(n))=r;

end
class=transpose(class_data);
cl=class-test_labels;
u=find(cl==0);

end
PrintTree(tree, tree.value);
conf_matrix  = confusion_matrix( class,test_labels );
