GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex      �      &�y���ڞu;>��.p   res://default_env.tres  `      �       um�`�N��<*ỳ�8   res://icon.png  0/      �      G1?��z�c��vN��   res://icon.png.import   �      �      ��fe��6�B��^ U�   res://project.binary <      �      r����������݊1   res://scenes/Game.tscn  �      A      &f�о����ݍ�L(   res://scenes/Server.tscn�      �       I��N��������   res://scenes/player.tscn�      �      8�/��R\Ԋ�<��   res://scripts/Game.gd.remap .      '       �*Y]�Gg�ܙ]L��)   res://scripts/Game.gdc  P      �      Y���8�����    res://scripts/Network.gd.remap  @.      *       TX�2�a��.��yW   res://scripts/Network.gdc   �      .      rE�V%�xK���L�p$   res://scripts/NetworkSetup.gd.remap p.      /       ������3�����Zz    res://scripts/NetworkSetup.gdc  %      �      g�\�ڴO@i�Ka    res://scripts/Server.gd.remap   �.      )       �z�����msPd#�*�   res://scripts/Server.gdc�(      �       r�(qf"T/�\�?���M    res://scripts/global.gd.remap   �.      )       Z0T\w$�=�����   res://scripts/global.gdcp)            �7���ǥ��aqW    res://scripts/player.gd.remap    /      )       �'���u�4�SX�   res://scripts/player.gdc�*      r      ����<��2P|�m�a��    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [gd_scene load_steps=3 format=2]

[ext_resource path="res://scripts/NetworkSetup.gd" type="Script" id=1]
[ext_resource path="res://scripts/Game.gd" type="Script" id=2]

[node name="Game" type="Node2D"]
script = ExtResource( 2 )

[node name="NetworkSetup" type="Control" parent="."]
margin_right = 1022.0
margin_bottom = 601.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="VBoxContainer" type="VBoxContainer" parent="NetworkSetup"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -217.0
margin_top = -78.0
margin_right = 221.0
margin_bottom = 72.0
alignment = 1
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ip_address" type="LineEdit" parent="NetworkSetup/VBoxContainer"]
margin_right = 438.0
margin_bottom = 24.0
align = 1
placeholder_text = "IP Address"

[node name="Host_button" type="Button" parent="NetworkSetup/VBoxContainer"]
margin_top = 28.0
margin_right = 438.0
margin_bottom = 88.0
rect_min_size = Vector2( 0, 60 )
text = "Host"

[node name="Join_button" type="Button" parent="NetworkSetup/VBoxContainer"]
margin_top = 92.0
margin_right = 438.0
margin_bottom = 152.0
rect_min_size = Vector2( 0, 60 )
text = "Join"

[connection signal="text_changed" from="NetworkSetup/VBoxContainer/ip_address" to="NetworkSetup" method="_on_ip_address_text_changed"]
[connection signal="pressed" from="NetworkSetup/VBoxContainer/Host_button" to="NetworkSetup" method="_on_Host_button_pressed"]
[connection signal="pressed" from="NetworkSetup/VBoxContainer/Join_button" to="NetworkSetup" method="_on_Join_button_pressed"]
               [gd_scene load_steps=2 format=2]

[ext_resource path="res://scripts/Server.gd" type="Script" id=1]

[node name="Server" type="Node"]
script = ExtResource( 1 )
 [gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]
[ext_resource path="res://scripts/player.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 32, 32 )

[node name="Player" type="KinematicBody2D"]
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="NetworkTickRate" type="Timer" parent="."]
wait_time = 0.03
autostart = true

[node name="Tween" type="Tween" parent="."]

[connection signal="timeout" from="NetworkTickRate" to="." method="_on_NetworkTickRate_timeout"]
      GDSC             �      ���ӄ�   �����Ķ�   �����϶�   �������Ӷ���   ������¶   �����ڶ�   �����������Ķ���   ����������ڶ   ���������������Ķ���   �Ҷ�   ��������������Ӷ   �������Ӷ���   �����������������Ķ�   ���Ӷ���   ��������Ҷ��   ���������������۶���   �����ض�   ����������������Ҷ��   �������������������Ҷ���   �������Ӷ���   �������Ӷ���   ���������Ӷ�      res://scenes/player.tscn      network_peer_connected        _player_connected         network_peer_disconnected         _player_disconnected      instance_player       _instance_player          toggle_network_setup                    Player         has connected         has disconnected                                              ,      -   	   8   
   9      C      L      M      T      ]      d      m      n      s      �      �      �      �      �      �      �      �      �      �      �      �       3YY;�  ?PQYY0�  PQV�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  �  T�  P�  RR�  Q�  �  &�  PQT�  �  V�  �  T�  P�  R�	  QYY0�  P�	  QV�  ;�
  �  T�  PQ�  �
  T�  P�	  Q�  �
  T�  �>  P�	  Q�  �  �  P�
  Q�  �
  T�  T�  �  P�
  R�
  Q�  Y0�  P�	  QV�  �?  P�  �>  P�	  Q�  Q�  �  �  P�	  QYY0�  P�	  QV�  �?  P�  �>  P�	  Q�  Q�  �  &�  P�>  P�	  QQV�  �  P�>  P�	  QQT�  PQY`  GDSC         .   �      ���Ӷ���   �����������ⶶ��   ���������ⶶ   �������   �����Ķ�   �����¶�   �����϶�   �������Ӷ���   ������¶   ������������Ķ��   �����������������������¶���   ����   ���������������Ķ���   ����������Ķ   ������������¶��   �������������������Ķ���   �������������������Ҷ���   �����������������Ҷ�   �����������������������ض���   ����������������Ҷ��   �Ҷ�   ���������������Ķ���   �����������Ķ���    q           	   127.0.0.1             connected_to_server       _connected_to_server      server_disconnected       _server_disconnected      connection_failed         _connection_failed        network_peer_connected        _player_connected         Creating server       Joining server     $   Successfully connected to the server      Disconnected from the server      Connection to server failed       Player connected:                                                       	   #   
   0      =      J      W      X      ^      c      d      l      u      ~            �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   3YY:�  Y:�  �  Y;�  �  Y;�  �  Y;�  �  YY0�  PQV�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�	  Q�  �  PQT�  P�
  RR�  Q�  Y0�	  PQV�  �?  P�  Q�  �  �  �
  T�  PQ�  �  T�	  P�  R�  Q�  �  PQT�  P�  Q�  Y0�  PQV�  �?  P�  Q�  �  �  �
  T�  PQ�  �  T�  P�  R�  Q�  �  PQT�  P�  Q�  Y0�  PQV�  �?  P�  QYY0�  PQV�  �?  P�  Q�  Y0�  PQV�  �?  P�  Q�  �  �  PQYY0�  P�  QV�  �?  P�  �>  P�  QQ�  Y0�  PQV�  &�  PQT�  PQV�  �  PQT�  �  Y`  GDSC            z      ������ڶ   �����϶�   �����ڶ�   ������¶   ��������������������������Ҷ   �������¶���   ������ݶ   �������   ����������������������Ҷ   ������������Ķ��   ���Ӷ���   ����������ڶ   �������Ӷ���   ��������������������Ҷ��   ����������������������Ҷ   ����������Ķ   ��������������������ƶ��   �������������Ӷ�   ������Ӷ      toggle_network_setup      _toggle_network_setup         instance_player                                                  	   	   
   
                     #      )      *      +      1      7      ;      <      K      L      R      X      \      ]      l      m      t      x      3YYYYYYYYY0�  PQV�  �  T�  PRR�  QYY0�  P�  QV�  �  T�  �  YYY0�  PQV�  �  T�	  PQ�  �
  PQ�  �  �  T�  P�  R�  PQT�  PQQYY0�  PQV�  �  T�  PQ�  �
  PQ�  �  �  T�  P�  R�  PQT�  PQQYY0�  P�  QV�  �  �  Y`            GDSC                   ���Ӷ���   �����϶�   ������ݶ   ������������Ķ��                   	            3YY0�  PQV�  �  T�  PQY`           GDSC             !      ���Ӷ���   ��������������Ķ   �Ҷ�   �������������������ƶ���   �����Ӷ�   �����϶�                   	                                 	      
                                 3YYB�  P�  QYB�  P�  QYYYY0�  PQV�  -YYYYYY` GDSC            t      ������������τ�   ��������������ض   ��������   ����ض��   ����ض��   ����Ķ��   ��������������Ӷ   ���������������Ŷ���   ����׶��   ����������������Ķ��   ��������������ض   ������������������������ض��   �����������Ӷ���   ���������ض�   �������������������϶���   ����¶��   ��������������������������¶   �������������Ӷ�   ���ƶ���      global_position   �������?      update_state                                                 !   	   '   
   -      0      2      3      ;      ?      @      O      U      V      \      b      i      l      r      3YYY;�  �  T�  Y5;�  W�  Y5;�  W�  YY0�  P�  QV�  &�	  PQV�  �
  �  PQ�  (V�  -YYH0�  P�  QV�  �  �  �  �  �  T�  PRR�
  R�  R�  Q�  �  T�  PQYY0�  PQV�  &�	  PQV�  �  P�  R�
  Q�  (V�  �  T�  PQY`              [remap]

path="res://scripts/Game.gdc"
         [remap]

path="res://scripts/Network.gdc"
      [remap]

path="res://scripts/NetworkSetup.gdc"
 [remap]

path="res://scripts/Server.gdc"
       [remap]

path="res://scripts/global.gdc"
       [remap]

path="res://scripts/player.gdc"
       �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         LouSangOnline      application/run/main_scene          res://scenes/Server.tscn   application/config/icon         res://icon.png     autoload/Network$         *res://scripts/Network.gd      autoload/Global          *res://scripts/global.gd)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres             