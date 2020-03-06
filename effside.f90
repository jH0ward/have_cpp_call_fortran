subroutine fortfunc(ii,ff,abc)
integer ii
real*4 ff
integer abc(3)
write(6,100) ii,ff
100 format('ii=',i2,' ff=',f6.3)
write(*,*)abc(1)
write(*,*)abc(2)
write(*,*)abc(3)
abc = [5,6,7]
return
end
