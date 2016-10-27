hold on
contour(pp)
colormap gray
V=[]
for i=4:length(I3)-3
    for j=4:length(I3)-3
        L=I3(i-3:i+3,j-3:j+3);
        if std2(L)==0
            V(end+1,1)=i;
            V(end,2)=j
            hold on
            plot(i,j,'or','MarkerFaceColor','r')
           
        end
    end
    i
end
xlswrite('V',V)