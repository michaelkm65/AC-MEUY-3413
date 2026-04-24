G = tf(1,[1,4,8])
Gc1 = tf(1,1)
Gc2 = tf(1,[1,0])
Gc3 = tf([1,0],1)

rlocus(G*Gc1,'b',G*Gc2,'g',G*Gc3,'r'); title('PID Controllers');
lgd = legend('k', 'k/s', 'ks');
title(lgd, "Controllers");
