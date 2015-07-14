program basis
implicit none
integer*4, parameter :: nmax=2 ! level truncation
integer*4, dimension(3000) :: nx, ny, nz, sz, tz, sum
integer*4 :: i, i1, i2, i3, i4, i5, summ, num0, num1, num2, num3, num4, nlev
real*8, parameter :: mp=938.27 , mn=939.57, hbarc=197.326, pi=3.1415926, ll=2.8655, rho0=0.17, kf=1.36
real*8 :: mc2
real*8, dimension(3000) :: e

!num0 number of degeneracy of n^2=0 state
!num1 number of degeneracy of n^2=2 state
!
!
!num4 number of degeneracy of n^2=4 state
!and so on


if(nmax**2==0) then
nlev=4
elseif(nmax**2==1)then
nlev=28
elseif(nmax**2==2)then
nlev=76
elseif(nmax**2==3)then
nlev=108
elseif(nmax**2==4)then
nlev=132
elseif(nmax**2==5)then
nlev=228
endif

mc2=(mp+mn)/2

i=1; num0=0; num1=0; num2=0; num3=0; num4=0
do i1=-nmax, nmax
	do i2=-nmax, nmax
		do i3=-nmax, nmax
		   summ=i1**2+i2**2+i3**2
		   if(summ<=nmax**2)then
			do i4=-1,1, 2
			   do i5=-1,1, 2
				sum(i)= summ
		   		nz(i)=i3 ; ny(i)=i2; nx(i)= i1
				sz(i)=i4; tz(i)=i5
		   		i=i+1
				if(summ==0)then
				num0=num0+1
				elseif(summ==1)then
				num1=num1+1
				elseif(summ==2)then
				num2=num2+1
				elseif(summ==3)then
				num3=num3+1
				else
				num4=num4+1
				endif
			   enddo
			enddo
		   endif
		enddo
	enddo
enddo

open(unit=30, file="spe.dat", status="unknown")

!write(*,*) num0, num1, num2, num3, num4

write(*,10)

do i=1,nlev+1
e(i)=2*pi**2*(hbarc)**2*sum(i)/(mc2*ll**2)
write(*,20) nx(i), ny(i), nz(i), sz(i), tz(i), sum(i), e(i), i
write(30,*) 1,sum(i), e(i)
enddo

20 format(i, 2x, i, 2x, i, 2x, i, 2x, i, 2x, i, 8x, F9.3, i)
10 format (11x,'nx',12x, 'ny',12x 'nz', 12x, 'sz', 12x, 'tz', 12x, 'n^2', 11x, 'Ei', 13x, 'i' ,/, &
            ' -------------------------------------------------------------------------------------------------------------')



end program 

