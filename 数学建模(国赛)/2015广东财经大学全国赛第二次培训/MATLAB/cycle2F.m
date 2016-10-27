clear
clc
NA=[475	382.5	267	2.4
476	373	250	1.9
477	330	219	0.8
478	400	247	2.3
479	441	442	1.7
480	417	312	1.5
481	332	246	1.9
482	321	275	1.7
483	403	140	2.1
484	420	269	2.4
485	455	335	1.9
486	295.5	238	1.4
487	294	244	1.1
488	316	300	1.5
489	308	257.5	1.2
490	327	255	0.8
491	316	236	1.4
492	314	230	0.9
493	313	223	0.6
494	317	215	0.2
495	318.5	222	0.3
496	320	229	0.5
497	326.5	227.5	0.7
498	325	220	0.6
499	323	213	0.4
500	329	212	0.7
501	332	226	0.7
502	334	210.5	0.6
503	346	209	0.7
504	342	200	0.8
505	356	202	0.7
506	358	195	0.6
507	345	194	0.4
508	348	188	0.4
509	357.5	188	0.6
510	359	159	1.1
511	404	161	1.2
512	403	202	0.8
513	379	202	0.7
514	386	213	0.8
515	373	213	0.6
516	363	212	0.4
517	362	218	0.8
518	354	216.5	0.6
519	348	215	0.9
520	349	222	0.7
521	353	223	0.8
522	371	224	0.8
523	371	218.5	0.6
524	375	219	0.4
525	388.5	218	1.1
526	405	213.5	0.8
527	389	224.5	0.9
528	388	233	0.6
529	353	229.5	0.8
530	334	232	0.7
531	336	239	1.1
532	352	247	1.2
533	353	236	0.6
534	362.5	236	0.8
535	370	236	1.1
536	388	237	1.2
537	395.5	237.5	1.4
538	395	233	1.1
539	408.5	227	1.5
540	430	237	1.4
541	450	268	0.1
542	394	254	1.4
543	387	250	0.9
544	383	250	1.1
545	369	249.5	0.8
546	367.5	249	0.7
547	362	249	0.8
548	350	251	0.6
549	348	255	1.4
550	355	265	1.1
551	367	265	0.8
552	367	257.5	1.2
553	375	258	1.4
554	376	260	1.1
555	381	260	1.7
556	378	266	1.4
557	380	270.5	1.2
558	371	284	1.1
559	356.5	281	1.4
560	338	297	1.2
561	372	307	1.4
562	398	308	1.5
563	392	277	1.1
564	382.5	276	0.9
565	396	270	1.4
566	411	291	1.2
567	424	297	0.8
568	435	319	0.9
569	434	307	0.7
570	430	295	1.4
571	441	309	1.2
572	470	342	0.2
573	468	432	1.2
574	455	361	0.6
575	453	400	0.6
576	425	433	0.8
577	462	437	1.4
578	481	457	0.6
579	462	447	1.2
580	440	449	1.4
581	423	448	1
582	435	507.5	0.4
];%%路口节点.

PA=[475
476
477
478
479
480
481
482
483
484
485];

LA=[475	555
475	565
476	545
477	501
478	542
478	566
479	577
479	580
480	568
482	489
482	559
484	539
484	570
485	571
485	572
485	573
486	487
486	491
487	488
488	482
488	560
489	487
489	490
490	481
490	550
491	481
491	492
491	530
492	493
492	496
493	494
493	495
494	495
494	499
495	498
496	495
496	497
497	498
497	501
498	499
498	477
499	500
500	477
500	502
501	520
501	530
502	503
502	504
504	505
505	506
505	513
506	507
506	509
507	504
508	507
508	509
508	510
509	510
510	511
511	512
511	483
512	513
513	514
514	515
515	516
516	517
517	518
517	523
518	505
518	519
518	521
519	503
519	520
520	521
521	522
521	529
522	523
522	527
523	524
524	515
524	525
525	514
525	526
526	512
527	525
528	527
528	529
528	536
528	538
529	530
530	531
531	481
531	532
532	533
532	547
532	548
533	529
533	534
534	535
535	536
536	537
537	538
537	478
538	539
539	526
539	540
539	478
540	541
540	484
542	543
542	565
543	536
543	544
544	476
544	555
545	535
545	546
546	547
546	552
547	534
548	549
548	552
549	481
549	550
550	551
550	559
551	552
551	556
552	553
553	476
553	554
554	555
556	554
556	475
557	475
557	558
557	564
558	559
560	549
560	561
561	558
561	562
562	563
562	480
563	564
563	565
565	566
566	567
567	480
567	569
568	569
568	574
569	570
569	571
570	571
572	541
572	578
573	578
574	575
575	576
576	479
577	573
577	579
580	579
580	581
581	576
581	582
582	578];

for i=1: length(NA);
for j=1: length(NA);
a(i,j)=inf;
end
end
for i=1: length(NA)
a(i,i)=0;
end
for i=1:length(LA)
x1=NA((LA(i,1)-474),2);%改
y1=NA((LA(i,1)-474),3);%改
x2=NA((LA(i,2)-474),2);%改
y2=NA((LA(i,2)-474),3);%改
d=((x2-x1)^2+(y2-y1)^2)^0.5;
a(LA(i,1)-474, LA(i,2)-474)=d;%改
a(LA(i,2)-474, LA(i,1)-474)=d;%改
end %%a为邻接矩阵
[D,R]=floyd(a);
P=[]
for m=486:582
    m
    for n=486:582
        for o=486:582
            for q=486:582
                for p=486:582
           PA(9)=m;
           PA(10)=n;
           PA(11)=o;
           PA(12)=q;
           PA(13)=p;
S=D(:,PA-474);%改
[min_S,index]=min(S,[],2);
%A=[index,NA(:,4)];
%A1 = A(:,1);
%A2 = A(:,2);
%B1 = unique(index);
%B2 = arrayfun(@(a)sum(A2(A1==a)),B1);


if max(min_S)<=30%&&max(B2)<=10;
   P(end+1,1)=m;
   P(end,2)=n;
   P(end,3)=o;
   P(end,4)=q;
   P(end,5)=p
end
   end
    end
    end
    end
end
xlswrite('DP',P)