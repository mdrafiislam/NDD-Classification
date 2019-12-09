function [ stride, stance, swing ] = process_signal( x )
fs=300;
x_dir=diff(x);
z=length(x);
y=1:z;
[a,b]=butter(20,0.2,'low');
x_dir_fil=filter(a,b,x_dir);
z1=length(x_dir_fil);
y1=1:z1;

[pks,cross] = findpeaks(x_dir_fil,'MinPeakDistance',200,'MinPeakHeight',0.07);

x_dir_fil_rot=-x_dir_fil;
[pks_rot,triangle] = findpeaks(x_dir_fil_rot,'MinPeakDistance',300,'MinPeakHeight',0.025);

figure(6)
subplot(211)
plot(y/300,x,'b')
title('Pressure sensor output of left foot of a participant')
xlabel('Time in Seconds')
ylabel('Amplitude in mV')
axis([0 26 -2 1])
subplot(212)
plot(y1/300,x_dir_fil,'b')
hold on
plot(cross/300,pks,'or')
plot(triangle/300,-pks_rot,'sr')
title('Filtered output of first derivative of pressure sensor output signal')
xlabel('Time in Seconds')
ylabel('Amplitude')
axis([0 26 -.1 .15])

cross_length=length(cross);
triangle_length=length(triangle);

for i=1:(cross_length-1)
    stride(i)=cross(i+1)-cross(i);
end
if (cross_length>=triangle_length)
    end_value=triangle_length;
else
    end_value=cross_length;
end
i=1;
if(cross(i)<triangle(i))
    for i=1:end_value
        stance(i)=triangle(i)-cross(i);
        if stance(i)<0
           stance(i)=triangle(i)-cross(i-1);
        end
    end
else
    for i=1:(end_value-1)
        stance(i)=triangle(i+1)-cross(i);
        if stance(i)<0
           stance(i)=triangle(i+1)-cross(i-1);
        end
    end
end
i=1;
if(triangle(i)<cross(i))
    for i=1:end_value
        swing(i)=cross(i)-triangle(i);
        if swing(i)<0
           swing(i)=cross(i)-triangle(i-1);
        end
    end
else
    for i=1:(end_value-1)
        swing(i)=cross(i+1)-triangle(i);
        if swing(i)<0
           swing(i)=cross(i+1)-triangle(i-1);
        end
    end
end

end

