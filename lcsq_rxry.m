function  H= lcsq_rxry(coordinate,n)
%   calculate lc squared and slope


             newcoord=zeros(n,2);
             newcoord(1,:)=coordinate(1,:);

             for k=2:n
                newcoord(k,:)=newcoord(k-1,:)+coordinate(k,:);
             end


              xbar=(newcoord(n,1)-newcoord(1,1))/(n-1);
             
              ybar=sum(coordinate(2:n,2))/(n-1);
             
% %
              oppositesides=zeros(n-2,1);

              for k=1:n-2
                 oppositesides(k,1)=norm(newcoord(k+2,:)-newcoord(k,:),2);
              end

              Lc=sum(oppositesides);
              lc=Lc/(n-2);
              H=[lc*lc,ybar/xbar];
              

end