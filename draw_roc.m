set(0,'DefaultAxesXLim',[0 0.03]);
set(0,'DefaultAxesYLim',[0 1.1]);


probe =[0 	0.0100;1- 0.9996 	0.7220 ;1-0.9990 	0.9010;1-0.9936 0.9950; 1-0.9904 	0.9970 ;1-0.9772 	1.0000;0.03 1 ];

plot( probe(:,1),probe(:,2), '--ko','MarkerFaceColor','k');
hold on;

ylabel('Detection Rate');
xlabel('False Positive Rate');

dos = [0 	0.9977  ; 1-0.9982 	0.9999 ;1-0.9952 	1.0000 ;0.03 1];
plot( dos(:,1),dos(:,2), '-ks','MarkerFaceColor','k');

u2r =[1-0.9968 	0;1-0.9962 	0.1026 ;1-0.9944 	0.3333 ;1-0.9860 	0.7692 ;1-0.9828 	1.0000;0.03 1];
plot( u2r(:,1),u2r(:,2), '-.kp','MarkerFaceColor','k');
   
r2l =[ 0 	0.0112 ;1-0.9964 	0.3122 ;1-0.9898 	0.9162 ;1-0.9760 	0.9925  ];
plot( r2l(:,1),r2l(:,2), ':k^','MarkerFaceColor','k');