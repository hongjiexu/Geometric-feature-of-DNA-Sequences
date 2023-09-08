clear
close all
clc

tic

%load dataset:

 %Alldata=fastaread('dataset1.fasta');
 %Alldata=fastaread('dataset2.fasta'); 
 %Alldata=fastaread('dataset3.fasta');
 %Alldata=fastaread('dataset4.fasta');
 


 
 len=length(Alldata);
 
 Hmatrix=zeros(24,len);


%calculate characterization vectors:

 for k=1:len
     Hmatrix(:,k)=(hvector_improved(Alldata(k).Sequence))';
 end



 %calculate similarity matrix:

 similarity_matrix=zeros(len,len);
 
 for k=1:len
     for l=1:len
         similarity_matrix(l,k)=norm(Hmatrix(:,k)-Hmatrix(:,l),2);
     end
 end

%construct phylogenetic tree:

tree=seqlinkage(similarity_matrix,'average',Alldata);
h = plot(tree, 'orient', 'left');
     
toc



