FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �
"Source Based Sorting" for iTunes 
written by Saevon
dot.saevon@gmail.com


The MIT License (MIT)

Copyright (c) 2015 Saevon

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

     � 	 	� 
 " S o u r c e   B a s e d   S o r t i n g "   f o r   i T u n e s   
 w r i t t e n   b y   S a e v o n 
 d o t . s a e v o n @ g m a i l . c o m 
 
 
 T h e   M I T   L i c e n s e   ( M I T ) 
 
 C o p y r i g h t   ( c )   2 0 1 5   S a e v o n 
 
 P e r m i s s i o n   i s   h e r e b y   g r a n t e d ,   f r e e   o f   c h a r g e ,   t o   a n y   p e r s o n   o b t a i n i n g   a   c o p y   o f 
 t h i s   s o f t w a r e   a n d   a s s o c i a t e d   d o c u m e n t a t i o n   f i l e s   ( t h e   " S o f t w a r e " ) ,   t o   d e a l   i n 
 t h e   S o f t w a r e   w i t h o u t   r e s t r i c t i o n ,   i n c l u d i n g   w i t h o u t   l i m i t a t i o n   t h e   r i g h t s   t o 
 u s e ,   c o p y ,   m o d i f y ,   m e r g e ,   p u b l i s h ,   d i s t r i b u t e ,   s u b l i c e n s e ,   a n d / o r   s e l l   c o p i e s   o f 
 t h e   S o f t w a r e ,   a n d   t o   p e r m i t   p e r s o n s   t o   w h o m   t h e   S o f t w a r e   i s   f u r n i s h e d   t o   d o   s o , 
 s u b j e c t   t o   t h e   f o l l o w i n g   c o n d i t i o n s : 
 
 T h e   a b o v e   c o p y r i g h t   n o t i c e   a n d   t h i s   p e r m i s s i o n   n o t i c e   s h a l l   b e   i n c l u d e d   i n   a l l 
 c o p i e s   o r   s u b s t a n t i a l   p o r t i o n s   o f   t h e   S o f t w a r e . 
 
 T H E   S O F T W A R E   I S   P R O V I D E D   " A S   I S " ,   W I T H O U T   W A R R A N T Y   O F   A N Y   K I N D ,   E X P R E S S   O R 
 I M P L I E D ,   I N C L U D I N G   B U T   N O T   L I M I T E D   T O   T H E   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y ,   F I T N E S S 
 F O R   A   P A R T I C U L A R   P U R P O S E   A N D   N O N I N F R I N G E M E N T .   I N   N O   E V E N T   S H A L L   T H E   A U T H O R S   O R 
 C O P Y R I G H T   H O L D E R S   B E   L I A B L E   F O R   A N Y   C L A I M ,   D A M A G E S   O R   O T H E R   L I A B I L I T Y ,   W H E T H E R 
 I N   A N   A C T I O N   O F   C O N T R A C T ,   T O R T   O R   O T H E R W I S E ,   A R I S I N G   F R O M ,   O U T   O F   O R   I N 
 C O N N E C T I O N   W I T H   T H E   S O F T W A R E   O R   T H E   U S E   O R   O T H E R   D E A L I N G S   I N   T H E   S O F T W A R E . 
 
   
  
 l     ��������  ��  ��        l    U ����  O     U    k    T       Z    (  ����  A        l   	 ����  e    	   ]    	    1    ��
�� 
vers  m       ?�      ��  ��    m   	 
   @ffffff  I   $��  
�� .sysodlogaskr        TEXT  b       !   b     " # " m     $ $ � % % n T h i s   s c r i p t   r e q u i r e s   i T u n e s   7 . 1   o r   b e t t e r . . .   ( c u r r e n t :   # l    &���� & e     ' ' 1    ��
�� 
vers��  ��   ! m     ( ( � ) )  )  �� * +
�� 
btns * J     , ,  -�� - m     . . � / /  C a n c e l��   + �� 0 1
�� 
dflt 0 m    ����  1 �� 2 3
�� 
disp 2 m    ����  3 �� 4��
�� 
givu 4 m     ���� ��  ��  ��     5 6 5 l  ) )��������  ��  ��   6  7�� 7 Z   ) T 8 9�� : 8 >  ) / ; < ; 1   ) ,��
�� 
sele < J   , .����   9 k   2 > = =  > ? > r   2 7 @ A @ 1   2 5��
�� 
sele A o      ���� 0 sel   ?  B�� B n  8 > C D C I   9 >�� E���� 0 set_sorting   E  F�� F o   9 :���� 0 sel  ��  ��   D  f   8 9��  ��   : I  A T�� G H
�� .sysodlogaskr        TEXT G m   A D I I � J J 6 S e l e c t   s o m e   t r a c k s   f i r s t . . . H �� K L
�� 
btns K J   E J M M  N�� N m   E H O O � P P  C a n c e l��   L �� Q R
�� 
dflt Q m   K L����  R �� S T
�� 
disp S m   M N����  T �� U��
�� 
givu U m   O P���� ��  ��    m      V V�                                                                                  hook  alis    8  Aeria                      �C6H+     l
iTunes.app                                                      F�Ϗ��        ����  	                Applications    �CHv      Ϗ��       l  Aeria:Applications: iTunes.app   
 i T u n e s . a p p    A e r i a  Applications/iTunes.app   / ��  ��  ��     W X W l     ��������  ��  ��   X  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     ��������  ��  ��   \  ] ^ ] i      _ ` _ I      �� a���� 0 trim   a  b c b o      ���� 0 sometext someText c  d�� d o      ���� "0 thesecharacters theseCharacters��  ��   ` k     \ e e  f g f l     �� h i��   h &   default values (all whitespace)    i � j j @   d e f a u l t   v a l u e s   ( a l l   w h i t e s p a c e ) g  k l k Z     m n���� m =     o p o o     ���� "0 thesecharacters theseCharacters p m    ��
�� boovtrue n r     q r q J     s s  t u t m     v v � w w    u  x y x 1    ��
�� 
tab  y  z { z I   �� |��
�� .sysontocTEXT       shor | m    	���� 
��   {  } ~ } o    ��
�� 
ret  ~  ��  I   �� ���
�� .sysontocTEXT       shor � m    ����  ��  ��   r o      ���� "0 thesecharacters theseCharacters��  ��   l  � � � l   ��������  ��  ��   �  � � � W    : � � � r   ( 5 � � � n   ( 3 � � � 7  ) 3�� � �
�� 
ctxt � m   - /����  � m   0 2������ � o   ( )���� 0 sometext someText � o      ���� 0 sometext someText � H     ' � � E    & � � � o     !���� "0 thesecharacters theseCharacters � n   ! % � � � 4  " %�� �
�� 
cha  � m   # $����  � o   ! "���� 0 sometext someText �  � � � l  ; ;��������  ��  ��   �  � � � W   ; Y � � � r   G T � � � n   G R � � � 7  H R�� � �
�� 
ctxt � m   L N����  � m   O Q������ � o   G H���� 0 sometext someText � o      ���� 0 sometext someText � H   ? F � � E  ? E � � � o   ? @���� "0 thesecharacters theseCharacters � n   @ D � � � 4  A D�� �
�� 
cha  � m   B C������ � o   @ A���� 0 sometext someText �  � � � l  Z Z��������  ��  ��   �  ��� � L   Z \ � � o   Z [���� 0 sometext someText��   ^  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 	0 split   �  � � � o      ���� 0 	thestring 	theString �  ��� � o      ���� 0 thedelimiter theDelimiter��  ��   � k      � �  � � � l     �� � ���   � . ( save delimiters to restore old settings    � � � � P   s a v e   d e l i m i t e r s   t o   r e s t o r e   o l d   s e t t i n g s �  � � � r      � � � n     � � � 1    ��
�� 
txdl � 1     ��
�� 
ascr � o      ���� 0 olddelimiters oldDelimiters �  � � � l   �� � ���   � - ' set delimiters to delimiter to be used    � � � � N   s e t   d e l i m i t e r s   t o   d e l i m i t e r   t o   b e   u s e d �  � � � r     � � � o    ���� 0 thedelimiter theDelimiter � n      � � � 1    
��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   create the array    � � � � "   c r e a t e   t h e   a r r a y �  � � � r     � � � n     � � � 2    ��
�� 
citm � o    ���� 0 	thestring 	theString � o      ���� 0 thearray theArray �  � � � l   �� � ���   �   restore the old setting    � � � � 0   r e s t o r e   t h e   o l d   s e t t i n g �  � � � r     � � � o    �� 0 olddelimiters oldDelimiters � n      � � � 1    �~
�~ 
txdl � 1    �}
�} 
ascr �  � � � l   �| � ��|   �   return the result    � � � � $   r e t u r n   t h e   r e s u l t �  ��{ � L     � � o    �z�z 0 thearray theArray�{   �  � � � l     �y�x�w�y  �x  �w   �  � � � i    � � � I      �v ��u�v 0 replacetext replaceText �  � � � o      �t�t 0 sometext someText �  � � � o      �s�s 0 olditem oldItem �  ��r � o      �q�q 0 newitem newItem�r  �u   � k     a � �  � � � l      �p � ��p   �^X
     replace all occurances of oldItem with newItem
          parameters -     someText [text]: the text containing the item(s) to change
                    oldItem [text, list of text]: the item to be replaced
                    newItem [text]: the item to replace with
          returns [text]:     the text with the item(s) replaced
         � � � �� 
           r e p l a c e   a l l   o c c u r a n c e s   o f   o l d I t e m   w i t h   n e w I t e m 
                     p a r a m e t e r s   -           s o m e T e x t   [ t e x t ] :   t h e   t e x t   c o n t a i n i n g   t h e   i t e m ( s )   t o   c h a n g e 
                                         o l d I t e m   [ t e x t ,   l i s t   o f   t e x t ] :   t h e   i t e m   t o   b e   r e p l a c e d 
                                         n e w I t e m   [ t e x t ] :   t h e   i t e m   t o   r e p l a c e   w i t h 
                     r e t u r n s   [ t e x t ] :           t h e   t e x t   w i t h   t h e   i t e m ( s )   r e p l a c e d 
           �  � � � r      � � � J      � �  � � � n       1    �o
�o 
txdl 1     �n
�n 
ascr � �m o    �l�l 0 olditem oldItem�m   � J        o      �k�k 0 temptid tempTID �j n      1    �i
�i 
txdl 1    �h
�h 
ascr�j   � 	
	 Q    ^ k    J  r    2 J    !  n     2   �g
�g 
citm o    �f�f 0 sometext someText �e o    �d�d 0 newitem newItem�e   J        o      �c�c 0 itemlist itemList �b n      1   . 0�a
�a 
txdl 1   - .�`
�` 
ascr�b   �_ r   3 J !  J   3 9"" #$# c   3 6%&% o   3 4�^�^ 0 itemlist itemList& m   4 5�]
�] 
ctxt$ '�\' o   6 7�[�[ 0 temptid tempTID�\  ! J      (( )*) o      �Z�Z 0 sometext someText* +�Y+ n     ,-, 1   F H�X
�X 
txdl- 1   E F�W
�W 
ascr�Y  �_   R      �V./
�V .ascrerr ****      � ****. o      �U�U 0 errormessage errorMessage/ �T0�S
�T 
errn0 o      �R�R 0 errornumber errorNumber�S   l  R ^1231 k   R ^44 565 r   R W787 o   R S�Q�Q 0 temptid tempTID8 n     9:9 1   T V�P
�P 
txdl: 1   S T�O
�O 
ascr6 ;�N; l  X ^<=>< R   X ^�M?@
�M .ascrerr ****      � ****? o   \ ]�L�L 0 errormessage errorMessage@ �KA�J
�K 
errnA o   Z [�I�I 0 errornumber errorNumber�J  =   pass it on   > �BB    p a s s   i t   o n�N  2   oops   3 �CC 
   o o p s
 DED l  _ _�H�G�F�H  �G  �F  E F�EF L   _ aGG o   _ `�D�D 0 sometext someText�E   � HIH l     �C�B�A�C  �B  �A  I JKJ i    LML I      �@N�?�@ 0 console  N O�>O o      �=�= 0 
customtext 
customText�>  �?  M k     PP QRQ r     
STS I     �<U�;�< 0 replacetext replaceTextU VWV o    �:�: 0 
customtext 
customTextW XYX m    ZZ �[[  'Y \�9\ m    ]] �^^  `�9  �;  T o      �8�8 0 
customtext 
customTextR _�7_ I   �6`�5
�6 .sysoexecTEXT���     TEXT` b    aba b    cdc b    efe m    gg �hh  l o g g e r   'f m    ii �jj $ S e t   S o r t i n g   F i e l d  d o    �4�4 0 
customtext 
customTextb m    kk �ll  '�5  �7  K mnm l     �3�2�1�3  �2  �1  n opo l     �0�/�.�0  �/  �.  p qrq i   sts I      �-u�,�- 0 set_sorting  u v�+v o      �*�* 0 sel  �+  �,  t O     �wxw k    �yy z{z r    	|}| 1    �)
�) 
pFix} o      �(�( 0 old_fixed_indexing  { ~~ r   
 ��� m   
 �'
�' boovtrue� 1    �&
�& 
pFix ��� l   �%�$�#�%  �$  �#  � ��� t    ���� k    ��� ��� r    ��� m    �"�"  � o      �!�! 0 	completed  � ��� r    ��� l   �� �� I   ���
� .corecnte****       ****� o    �� 0 sel  �  �   �  � o      �� 	0 total  � ��� l   ����  � . (set progress total steps to count of sel   � ��� P s e t   p r o g r e s s   t o t a l   s t e p s   t o   c o u n t   o f   s e l� ��� l   ����  � 3 -set progress description to "Script Progress"   � ��� Z s e t   p r o g r e s s   d e s c r i p t i o n   t o   " S c r i p t   P r o g r e s s "� ��� l   ����  �  �  � ��� l   ����  �  �  � ��� X    ����� k   . ��� ��� r   . 4��� l  . 2���� e   . 2�� n  . 2��� 1   / 1�
� 
pAlb� o   . /�� 0 
this_track  �  �  � o      �� 0 album_title  � ��� r   5 ;��� l  5 9���
� e   5 9�� n  5 9��� 1   6 8�	
�	 
pnam� o   5 6�� 0 
this_track  �  �
  � o      �� 	0 title  � ��� l  < <����  �  �  � ��� l  < <����  � % Progress bar code: for yosemite   � ��� > P r o g r e s s   b a r   c o d e :   f o r   y o s e m i t e� ��� l  < <����  � E ?set progress additional description to (get this_track's title)   � ��� ~ s e t   p r o g r e s s   a d d i t i o n a l   d e s c r i p t i o n   t o   ( g e t   t h i s _ t r a c k ' s   t i t l e )� ��� l  < <����  � / )set progress completed steps to completed   � ��� R s e t   p r o g r e s s   c o m p l e t e d   s t e p s   t o   c o m p l e t e d� ��� r   < A��� [   < ?��� o   < =� �  0 	completed  � m   = >���� � o      ���� 0 	completed  � ��� n  B R��� I   C R������� 0 console  � ���� b   C N��� b   C L��� b   C J��� b   C H��� b   C F��� m   C D�� ���  � o   D E���� 0 	completed  � m   F G�� ���  /� o   H I���� 	0 total  � m   J K�� ���  :  � o   L M���� 	0 title  ��  ��  �  f   B C� ��� l  S S��������  ��  ��  � ���� Q   S ����� k   V ��� ��� r   V b��� n  V `��� I   W `������� 	0 split  � ��� l  W [������ e   W [�� n  W [��� 1   X Z��
�� 
pCmt� o   W X���� 0 
this_track  ��  ��  � ���� m   [ \�� ���  ;��  ��  �  f   V W� o      ���� 0 comments  � ��� l  c c��������  ��  ��  � ��� Y   c ��������� k   q �    r   q w n   q u 4   r u��
�� 
cobj o   s t���� 0 i   o   q r���� 0 comments   o      ���� 0 track_source   	 l  x x��
��  
 " Trims spaces from both sides    � 8 T r i m s   s p a c e s   f r o m   b o t h   s i d e s	 �� r   x � l  x ���� n  x  I   y ������ 0 trim    o   y z���� 0 track_source   �� m   z { �   ��  ��    f   x y��  ��   n       4   � ���
�� 
cobj o   � ����� 0 i   o    ����� 0 comments  ��  �� 0 i  � m   f g���� � I  g l����
�� .corecnte****       **** o   g h���� 0 comments  ��  ��  �  l  � ���������  ��  ��     l  � ���!"��  ! 9 3 Don't update the sorting field if it isn't special   " �## f   D o n ' t   u p d a t e   t h e   s o r t i n g   f i e l d   i f   i t   i s n ' t   s p e c i a l  $%$ Z   � �&'��(& =  � �)*) l  � �+����+ I  � ���,��
�� .corecnte****       ****, o   � ����� 0 comments  ��  ��  ��  * m   � �����  ' k   � �-- ./. l  � ���01��  0 @ : If the track is from special artist, then use that as the   1 �22 t   I f   t h e   t r a c k   i s   f r o m   s p e c i a l   a r t i s t ,   t h e n   u s e   t h a t   a s   t h e/ 343 l  � ���56��  5   album sort   6 �77    a l b u m   s o r t4 8��8 r   � �9:9 l  � �;����; e   � �<< n  � �=>= 1   � ���
�� 
pArt> o   � ����� 0 
this_track  ��  ��  : n     ?@? 1   � ���
�� 
pSAA@ o   � ����� 0 
this_track  ��  ��  ( k   � �AA BCB r   � �DED l  � �F����F e   � �GG n   � �HIH 4   � ���J
�� 
cobjJ m   � ����� I o   � ����� 0 comments  ��  ��  E o      ���� 0 track_source  C K��K r   � �LML o   � ����� 0 track_source  M n     NON 1   � ���
�� 
pSAAO o   � ����� 0 
this_track  ��  % P��P l  � ���������  ��  ��  ��  � R      ��QR
�� .ascrerr ****      � ****Q o      ���� 0 message  R ��S��
�� 
errnS o      ���� 0 code  ��  � n  � �TUT I   � ���V���� 0 console  V W��W b   � �XYX b   � �Z[Z b   � �\]\ m   � �^^ �__  E r r o r  ] o   � ����� 0 message  [ m   � �`` �aa   Y o   � ����� 0 code  ��  ��  U  f   � ���  � 0 
this_track  � o   ! "���� 0 sel  �  � m    ����u0� bcb l  � ���������  ��  ��  c ded r   � �fgf o   � ����� 0 old_fixed_indexing  g 1   � ���
�� 
pFixe h��h l  � ���������  ��  ��  ��  x m     ii�                                                                                  hook  alis    8  Aeria                      �C6H+     l
iTunes.app                                                      F�Ϗ��        ����  	                Applications    �CHv      Ϗ��       l  Aeria:Applications: iTunes.app   
 i T u n e s . a p p    A e r i a  Applications/iTunes.app   / ��  r j��j l     ��������  ��  ��  ��       ��klmnopq��  k �������������� 0 trim  �� 	0 split  �� 0 replacetext replaceText�� 0 console  �� 0 set_sorting  
�� .aevtoappnull  �   � ****l �� `����rs���� 0 trim  �� ��t�� t  ������ 0 sometext someText�� "0 thesecharacters theseCharacters��  r ������ 0 sometext someText�� "0 thesecharacters theseCharacterss 	 v����������������
�� 
tab �� 

�� .sysontocTEXT       shor
�� 
ret �� 
�� 
cha 
�� 
ctxt������ ]�e  ���j �jj �vE�Y hO h���k/�[�\[Zl\Zi2E�[OY��O h���i/�[�\[Zk\Z�2E�[OY��O�m �� ���~uv�}�� 	0 split  � �|w�| w  �{�z�{ 0 	thestring 	theString�z 0 thedelimiter theDelimiter�~  u �y�x�w�v�y 0 	thestring 	theString�x 0 thedelimiter theDelimiter�w 0 olddelimiters oldDelimiters�v 0 thearray theArrayv �u�t�s
�u 
ascr
�t 
txdl
�s 
citm�} ��,E�O���,FO��-E�O���,FO�n �r ��q�pxy�o�r 0 replacetext replaceText�q �nz�n z  �m�l�k�m 0 sometext someText�l 0 olditem oldItem�k 0 newitem newItem�p  x �j�i�h�g�f�e�d�j 0 sometext someText�i 0 olditem oldItem�h 0 newitem newItem�g 0 temptid tempTID�f 0 itemlist itemList�e 0 errormessage errorMessage�d 0 errornumber errorNumbery �c�b�a�`�_�^{�]
�c 
ascr
�b 
txdl
�a 
cobj
�` 
citm
�_ 
ctxt�^ 0 errormessage errorMessage{ �\�[�Z
�\ 
errn�[ 0 errornumber errorNumber�Z  
�] 
errn�o b��,�lvE[�k/E�Z[�l/��,FZO 4��-�lvE[�k/E�Z[�l/��,FZO��&�lvE[�k/E�Z[�l/��,FZW X  ���,FO)�l�O�o �YM�X�W|}�V�Y 0 console  �X �U~�U ~  �T�T 0 
customtext 
customText�W  | �S�S 0 
customtext 
customText} Z]�Rgik�Q�R 0 replacetext replaceText
�Q .sysoexecTEXT���     TEXT�V *���m+ E�O��%�%�%j p �Pt�O�N��M�P 0 set_sorting  �O �L��L �  �K�K 0 sel  �N   �J�I�H�G�F�E�D�C�B�A�@�?�J 0 sel  �I 0 old_fixed_indexing  �H 0 	completed  �G 	0 total  �F 0 
this_track  �E 0 album_title  �D 	0 title  �C 0 comments  �B 0 i  �A 0 track_source  �@ 0 message  �? 0 code  � i�>�=�<�;�:�9�8����7�6��5�4�3�2�1�^`
�> 
pFix�=u0
�< .corecnte****       ****
�; 
kocl
�: 
cobj
�9 
pAlb
�8 
pnam�7 0 console  
�6 
pCmt�5 	0 split  �4 0 trim  
�3 
pArt
�2 
pSAA�1 0 message  � �0�/�.
�0 
errn�/ 0 code  �.  �M �� �*�,E�Oe*�,FO�njE�O�j E�O ��[��l kh ��,EE�O��,EE�O�kE�O)�%�%�%�%�%k+ O c)��,E�l+ E�O %k�j kh ��/E�O)��l+ ��/F[OY��O�j j  �a ,E�a ,FY ��k/EE�O��a ,FOPW X  )a �%a %�%k+ [OY�\oO�*�,FOPUq �-��,�+���*
�- .aevtoappnull  �   � ****� k     U��  �)�)  �,  �+  �  �  V�(   $ (�' .�&�%�$�#�"�!� �� I O
�( 
vers
�' 
btns
�& 
dflt
�% 
disp
�$ 
givu�# �" 
�! .sysodlogaskr        TEXT
�  
sele� 0 sel  � 0 set_sorting  �* V� R*�,� � �*�,E%�%��kv�k�l��� Y hO*�,jv *�,E�O)�k+ Y a �a kv�k�l��� Uascr  ��ޭ