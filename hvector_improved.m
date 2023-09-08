function H=hvector_improved(a)
%HVECTOR  this function calculates the H vector for a DNA sequence
%a must be a character-valued vector, not a matrix or others.


n=size(a,2);


v1=[1/2,sqrt(3)/2];

v2=[sqrt(3)/2,1/2];

v3=[sqrt(3)/2,-1/2];

v4=[1/2,-sqrt(3)/2];


C={v1,v2,v3,v4};


H=zeros(1,24);


%
coord=zeros(n,2);

%12 mappings

for t=1:2
    if t==1 %A=v4
        Allpermutations=perms(1:3);
        for m=1:6
            P=Allpermutations(7-m,:);

            %assign atcg

            coord1=mapping(coord,a,t,n,C,P,v3,v4);

            %compute lc squared and rx times ry

            H(1,(2*m-1):2*m)=lcsq_rxry(coord1,n);
             
        end
        
     else  %A=v3
            Allpermutations=perms([1,2,4]);
            for m=1:6
                P=Allpermutations(7-m,:);

                %assign atcg

                coord2=mapping(coord,a,t,n,C,P,v3,v4);
                %compute lc squared and rx times ry

                H(1,(12+(2*m-1)):(12+2*m))=lcsq_rxry(coord2,n);
                
            end
    end
end



end


