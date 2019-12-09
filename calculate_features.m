function [features] = calculate_features(stride, stance, swing)

minv(1)=min(stride);
minv(2)=min(stance);
minv(3)=min(swing);

maxv(1)=max(stride);
maxv(2)=max(stance);
maxv(3)=max(swing);

meanv(1)=mean(stride);
meanv(2)=mean(stance);
meanv(3)=mean(swing);

stdv(1)=std(stride);
stdv(2)=std(stance);
stdv(3)=std(swing);

varv(1)=var(stride);
varv(2)=var(stance);
varv(3)=var(swing);

covs(1)=stdv(1)./meanv(1);
covs(2)=stdv(2)./meanv(2);
covs(3)=stdv(3)./meanv(3);

for i=1:3
    features(i)=minv(i);
end
j=1;
for i=4:6
    features(i)=maxv(j);
    j=j+1;
end
j=1;
for i=7:9
    features(i)=meanv(j);
    j=j+1;
end
j=1;
for i=10:12
    features(i)=stdv(j);
    j=j+1;
end
j=1;
for i=13:15
    features(i)=varv(j);
    j=j+1;
end
j=1;
for i=16:18
    features(i)=covs(j);
    j=j+1;
end

end

