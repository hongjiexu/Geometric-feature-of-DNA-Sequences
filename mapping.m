function v= mapping(coordinate,a,t,n,C,P,v3,v4)
%  mapping function

for k=1:n
     switch a(k)
            case 'A'
                if t==1
                   coordinate(k,:)=v4;
                elseif t==2
                    coordinate(k,:)=v3;
                end
            case 'T'
               coordinate(k,:)=C{1,P(1,1)};
            case 'C'
               coordinate(k,:)=C{1,P(1,2)};
            case 'G'
               coordinate(k,:)=C{1,P(1,3)};
      end
end
v=coordinate;

end