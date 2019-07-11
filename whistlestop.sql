CREATE OR REPLACE FUNCTION public.whistlestop()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
  cat text[];
  i int default 1;
BEGIN
   cat := array['
                                                                    
                                                                    
                                                                    
                                                                    
                                     '',,                            
                                  ''cdxxxc                           
                                 ''ddxxxko:''                         
                                 ''ddxxxxxxl;''                       
                                   :xkkkkkxxdl''                     
                                    xxdddxxxo:                      
                                    ldlc:cll''                       
                                   ;cdxoll:''                        
                                   l:cxxxx:                ,ld;     
                                  :occdxxxkd;            ,xocld;    
                                  :lllcodxxdd;         ;ldxdc;''     
                                ::l::lllllcccddo:''  ,cdOO0x;        
                    ,;;,''     ,oc:c:::cclllloloodxddxkOldO0Ol       
            '',;:clodoloxOkl'''';cc;:llc:loxkxxdddooddxo:dxdOkOk,      
         ''cdkkxkOOOOOO00000kc:cc:cllloxkOkdddxxddlodccoOkkkkk,      
       ;lol::cokOOOkxxkOOOOx;:cc:::lkkxxxkkkO0KOoccoxkkkkkkko       
     ,:,   ;dkkxdccldxOO000x:;ccc::oxxxkkkkxkkOkooxkkkkkkkko        
          okkd:  cxkkkOOkkkkoc;cccc:ldkOkkkkkkOkxldkkOkxdl,         
         lkd''  ;dxl:oxxkkOOxxdlc::cccldkOkkkkOkkd:;;,''              
        ;kx''  ;xo,,dl;:c;odxkOkkxdoccc;   ''lkk,                     
        ld;   l, ''o,   ,dkxocoddddl;'',;;;   l,                      
        ll   ,''  ;    :dool:,cxxd,     ;;,                          
        ;;            ;;,''   :xxc     ,::,                          
                             ldc       ,''                           
                            ;oo,                                    
                            ldo                                     
                             ,:                                     
                              ,''                                    
                             '';:                                    
                              '':,                                   
                               ;:;,;::;''                            
                             '',,'',,,,,,:;                           
                                                                    
                                                                    
','
                                                                    
                                                                    
                                                                    
                                    ,;:;                            
                                  ;oxxxxc                           
                                 ,xxxxxxolc                         
                                  oxxxxxxxo;,                       
                                   ;dkkkkkxxdo:                     
                                    dxdddddxxo;                     
                                   :lxocc:cc,                       
                                  dl:odolc,                         
                                 ''l:cdxxxo                          
                                 ;::coxxxkd;              :lc       
                                 cllccoxxxxd''           :occoc      
                               ;;l:cllloolcll:''      '':oxdo:;       
                             ,l:;cc:ccc:::cccclc:,,;lxkko''          
                   '''''';''   '';cc;;:cc:cc::lllllooddddxokOkl          
               '',:coxkOOkoc:;cc;:clccoxkkOkxoollooodkldkkkc         
           '';lxkkkOOkOkkkko;:cc:::coxxxxxxxxkOOoloolkkOOxkc         
         ;dkxxkkOkkxxkkOOkl:::c::::oxxxxxxkxkxkkxkkkkkkkxx''         
       ,oo::oxkxxocldkOOOOd:;;:cc::lkkkkkkkxkkkkOkkkkkxkx''          
      :l;'':kkkxc'';dxxdkkkkkdlc:::cccxxodoloxkkkkOkkkkdo;            
     ''  ''dkxd;  lxo;,lxkOOxdxxdlcc::::c;,,,ckx:;;,''''                
       :xxxc   od:  od;;:lddkOkxxx:;::,,''                           
      ''dccc   :d;  ;l   ,dddxdodo;  ;,'' '';;,                        
      :, ,    c,   ,   ''xxdllodo:''       '':c:                       
      ''                lc:, cdd,         ;:l,                       
                            ool                                     
                           ;oo;                                     
                            lo''                                     
                             :                                      
                             ;                                      
                            ,c''                                     
                             ,;                                     
                             ,:;,;cc:''                              
                            ,''     '''',                              
                                                                    
                                                                    
','
                                                                    
                                                                    
                                    '',''                             
                                   ldddc                            
                                  dxxxxo,,                          
                                  dxxxxkxd:;                        
                                  ,oxxxxxxxxolc''                    
                                    :xxkxxxxxxo,                    
                                    ,xdoolcll;                      
                                   ;clxdcc::,                       
                                  ''o:cxxxx,                         
                                  ,::cdxxko''                        
                                  c::cdxxxxo''             ;lc       
                                ''llolccdddloc           coccoc      
                             ;c;:c::llllccccxo;''     ;cdddl:;       
                  '',,,;''   ,cl:;cc;;:c:::ccccllllc:cdxkOo''          
                '',:coxOOd:;:cc;;cc:::coxxdddxkdodolxklxOOd''         
            '':oxkkOOOOOOkc;:cc;:clc:cdxkkkkkkOdlooodOdkkkkl         
           oxxkOOOkxkkkOOl;:c::;;:ldxxxxxxxxxxkkdkkxkkkkxk:         
          okOOOkxxocdkOOOx:;::c:;;lxxxxxxxxxxkkO0kkkxxxxd;          
         oxkkkxxo'';dkkOOOkxc;;:cc::oxOkkkkkkxkkOOkkkkdl;            
       ,l:oxkxxc ,dkxkkkkOxxol::;:cccll;,,;;oxkd:;,                 
       , lxddxo  cxc,oddd:odddddol;''         ''l                     
        :xc cd:  ll ;x;    oddxdc                                   
       ''d:  ''d''  l: :l     ;xdx:                                    
       :l    c''  ;,  ''     :kdd    '',;:c:;;:;,,''                    
       :                   lxllc;,,:,  ''    ,:cc;                   
                          ,oo:               '';,''                   
                          ''oo                                       
                           ;,                                       
                           ;                                        
                           :                                        
                         '',:                                        
                           ;,                                       
                          '';:::cc:,                                 
                         ,''     ''''''''                                
                                                                    
                                                                    
','
                                                                    
                                                                    
                                   :ol;                             
                                  cxxxx:                            
                                  oxxxxxll''                         
                                  cdxxxxxxoo;'',                     
                                   :dxxkkkxxxxxl                    
                                     dkkxkkxxdc                     
                                     ddollccl;                      
                                   ,lldocc:;,                       
                                   l::dxxx;                         
                                  ''c::oxxko''                        
                                  cc::oxxkxo                        
                               '' ;lllccoddod:            ;:oo       
                ''''          ,:c::c::cclccccloc;''      ''cdoc:o:      
                '';coxxo:'''';:cc;:c:;;cc::;::;:cccc:;:okkdc:;,''       
             ,codkkkOOOOd:;cc:;ccc::lldxxxkkkolddxxOxkOxc           
          ,lxkkkOkkkkkkkl;::c::clc;cdkkkxkxkkxooooxko;xkko          
         ,xxkOOkxkxlxkOko;;:::;;:coxxxxxxxxxkkkxoooxkkkxkk''         
         lxdkkxxxc:dkkxxxc;:cc:;;;oxxxxxxxxxxkkOxdxxxxxxx:          
        ;d:dkxxo'',xxxc:dxdc;;:ccc:coOOkkkkxdxkkooxxxxxdc            
        l,:xxdd  :dd,;xkkOkdllc:cclloxlc:;;;lxdcccc:,               
       '', oxxd:  cx: cd;:oddddddddl:,                               
          dxdx;  :x, l: ; ''xdddx;                                   
          lo ;:   d'' l    cdxxddc                                   
          ;o      ''      ''doddxod,                                  
           c''            loo, ;xdo''                                 
            ''           cod;   lc:c;,''                              
                        ,oo           c;,::;,''                      
                         ;,           ''  ,'''',;::,                   
                         ,''                   cocc''                 
                         ;                    :col;                 
                       '';c                    ''                     
                         ;''                                         
                        '';;'';::;,                                   
                      '';,''   ''''''                                    
                                                                    
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                   ,::''                             
                                  ,xxxxc                            
                                  ,xxxxxl:o,                        
                                   oxxxxxxxddll:                    
                                    cdxxkkkxxxxc                    
                                      lkkkxdol;                     
                                      ooolc::l''                     
                                     ''lxdlcc''                       
                                   ,c::oxxxl                        
                                  ,l::ccdxxx:                       
                               '',:ccc::coxxkx;              ''''      
             ,;;,         ''clc::cc:clllcldxddxc,''        llool,     
               ;cdxodo:,;:cc::ccc::cc:cc::lc:ccccc;,'',;cxkdlco:     
           ,:lodxkOOkkkl:ccccc:::::cloxxdoollloodxxkOO0k:,,''        
         cxxxodkkkOOOOkl:ccc::ccccccoxkxlclolclododk0OkOd,          
       ldoc,:cdkkkkkkkkxc:cc::cccccodxxxxxkOOOlclodxkOOkko          
     ;l;  ''lkkxxxl:cdkkkxc:ccc:::cxxxxxxxxxxkkxoodxkxxkxx:          
    :,   cxkxxo,  :xkkxdoxlccccccldxxxxxxxxxkOkkxxxxxxd;            
        cxkxx:  ,dko;;:ldkkkxolllllxxxxxxdxxkkxdxkkxo,              
       ;dxxc   cxc  cxdc:dOOkddddddddl,    cxx:                     
       cxo    ;;   :dc  ;llxxdddddo,        ::                      
       cx,        ''l    ;''oodkdodd:                                 
        o''        ;      :ooolodddl                                 
                        :ooc   lddo''                                
                       loo,     cxo:                                
                      ''oo''       odo                                
                       ;''         coc                               
                      ,''            ;;                              
                    ''::              ;;                             
                     ;''              ,:c,                           
                    ,;;'',:cc;,          ;;                          
                  '';''     '''',''         ;::::;::ccc:                 
                                             '''',;''''                 
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                     ;lol:                          
                                     ''oxxxxc:,                      
                                      ;xxxxxxdc''                    
                                       ldxxxkxxocc,                 
                                        ;kkkkkkxxxo                 
                                        ;xxooooddc                  
                                      ,ccddo:ccc;                   
                                    ''llccxxko,                      
                                    lc::oxxkd                       
                                   llc::oxxxxl                      
                                ;:colxoccoxddx;              '',''    
                              :dc:l:;collccclool:,        ''ldooo:   
                 ,,;:;:xd:'''';cl::cc:::lccllxxooddoc;'';:loxxxxlcl:   
                ,ccodkOOOOOlclc;:llcclxkkkkkkkkkO00OxkO00x,         
              ;oxkOOO00OOOk:clc:cllcoxxxxxxxxkkkO0OxxOkkkOd         
            ;oxookOOkkkkkOkl:ll:::cdxxxxxxxxxkkkkxkkx0kOxOk;        
          ''lo:cdOkkkdlokOOOOocllc:;oxkxxkkkxkxdooxOkkkxkkx:         
         ;d; ckkxx: ;okOOxOOOxocclllodkO0kdlloodkkxxxxxo;           
        ,:  cxkxo  :xxxlldkOO0kdoooooodc::,;:c:::cloc;''             
           ,xxkl  ''dxo,oxoxOkkOdddxdc;                              
           :xkd   ''dl ,d,;kxddddddo                                 
           ;dx:    o'' ;:,odd:  lddo                                 
            do     ''  :ddo:    ''ooo                                 
            ;o        :dl       cdo,                                
             ''        ;''         doc                                
                  ,;;:           cdo                                
                   ;:             ;:                                
                  '';               ;,                               
                ;::;              '':l,                              
                  ,::''              :c                              
                   '';cl:,            ::                             
                      '',''''         ::;;::cllll:                     
                                          ,;;:,                     
                                                                    
','
                                                                    
                                                                    
                                                                    
                                       looc,                        
                                       cxxxxc''''                     
                                       ;xxxxxxl                     
                                       ''dxxxxxdlc                   
                                        ,okkkkkxxoo,                
                                         oxdxxkkxxx;                
                                      '';:odccllll;                  
                                    ''coc:oxdl:;,                    
                                   ,c:::cdxkd                       
                                  ,lllc:lxxxx:                      
                               '';lccc;oocoxxkx;                 '',  
                       ''     ,:ll::c:;cllldolddlc,           lloloc 
                 '';cdxdkOdc;::cc;::c:;:ccokOkkxkOxlc,'',;clooxxdlcl: 
                ''cdkkkOOOOOc:clc:cll::oxkkkkxxkkOkxxkxxkO00x, ''     
              ,oxkkOOkkkkOkc::cc::ccodxxxxxxxxkOOollolxx:xOO;       
             oxkkkkkkkxxOO0x::clc:;ckxxxxxxxxxkOoccokdxkxkkOc       
            cxkOkkxxl:okOkOOxc:cll:cxxxxxxxkOxl::lxkkkkkxkdl        
            dxOkkxd'';dkxllxO0OdlcclloxxxxO00kllodoxkkkxxl;          
           ,xxdxxd :xxl''cxdkkkkxxdoooodl,  '',,;;;;,:c:,             
           ,;cxkx; lxc ;kxdkxxkdddxd:,                              
             ,dkx  lxcckxdlc;;:dddx''                                
              oc,  l:cl:''      :dod                                 
              ::     ,''         ood                                 
               :     ;,         ldd                                 
                     '',         ;xo''                                
                      ,          oo,                                
                     '';''          :                                 
                   '';:;           ''''                                
                     ;;         '''';:                                
                    ::,           '':,                               
                   ,c:;            ''c''                              
                   ''ccc''          '';c:,                             
                                     ,llcc:;                        
                                       ,,;,,''                       
                                                                    
','
                                                                    
                                                                    
                                                                    
                                          ,ldd:                     
                                         ,xxxxo                     
                                         :dxxxd,                    
                                         ,dxxxxx:                   
                                          lxxxxxdc                  
                                         ''xkkkkxxxo:                
                                      ;c:lxooodxxxd;                
                                    :cc:coxdcccll''                  
                                   ;lcccldxxd,''                 ,,  
                                  :l::ccoxxkx,               :clod; 
                                ,cllcllcldxxxx;           ,;oxolcl: 
                   ''''       '',:cc:cc;:lclodooxdc:,''   ;lxOkoc,''     
                    ,:lxko::;:lc;:c:;;:lcldxkdxkkkoodxkkkOOd''       
               '';loxkkkOOOx::cc;;:clc:cokOOOkdxkOOdodoxkoxkOx''      
             :dxkOOkkkkkkOkc:cc:;:ccccdxxxxxxxkkOxcldldkxkxkO;      
           ,xkkOkkxxxdolloxd::cl:;;;okxxxxxxxxxOkccldkkxxxxxc       
          ;xOOkxkdc, '':codxOxc:ccc::lxxxxxxxkxxlcllxkxxxxxl,        
          ookxxo,  cxOkdkOOOOOdlccllloddxOkxdollloclxkdlc''          
           :kxc  ;dxl:cxkxk00Okxxxdddddc,''    ''''''''''                 
           :kd   dxocxkxxxkkkdddddxdl;                              
           ,x:  ;c,'';:cllc;,cxdddo''                                 
            l,         ,   :oxddd''                                  
            ,,             '':dodc                                   
                        '','',lxdo                                    
                        ,;;;lkdc                                    
                            :xd,                                    
                             :o''                                    
                              ;''                                    
                              ,;                                    
                             '':c;                                   
                               ,c''                                  
                                ::                                  
                              '';,,:lccc:;                           
                                    '',,''''                           
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                            '':cll;                  
                                           :dxxxxc                  
                                          :xxxxko                   
                                          dxkkkko:                  
                                         lkkkkkkxc                  
                                       ;cdkxkOkkxo''                 
                                    ;clccoolodxkxxo                 
                                   llccccdocllc:;;                  
                                  llccccoxxkl''''               ;co;  
                                 ,olccccdxxko               :xocld, 
                                ;collooloxxxxd,          ;cdxdl:;''  
                   ;:,       '';oc:c:;:oocllccodl:,   ;cdOkdc,       
                    '':loo;  ;:cc;:::;;cccoodkkdddddoxxkxkOkl        
             '',;cloolc::dOd:;cc;;ccc::oxOOxkOxooodxdookxdkOOo       
          :oxxxkOOO0O00OO0x::c:;:cclldxkkkkkkkOO0kddolkkkkkOl       
       :cc:;:cdkOOOOOkOOOOx::cc;;;cxxxxxxxxxkO0KKooldkkkkxxo        
          :dOkkxddodkOOOOOOo::cc:;cxkxxxxxxxkkkkkkkkkxxkkx;         
        ,dkxoc;:cdkOxdkOOOOOo:;cllloxkOOOkOkkkxxxoloolc:,           
       lkd:'' ,odl:,,cokO0OOOkxdlllllloooc,      ''                   
      cd;  ''c:    '','':dodddkdddxOxdl:,                              
     ::                    oddddll;,''                               
     ,                     oodo '';'',::                              
                          ''dod,     c:;                             
                          ckdl   ;ll::''                             
                          xdo                                       
                         ''ddl                                       
                           :;                                       
                           ;;                                       
                          ''::                                       
                           ,c;                                      
                            ::''                                     
                          ,;;;:cccc::                               
                                '',;,,                               
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                           ,:::;''                   
                                         :xxxxxxd                   
                                        cxxxxxxx:                   
                                       ''xkkxxxx:''                   
                                      ,lkkkOkxxd;                   
                                    ;:clkddkkxxd:                   
                                   :lccoklcllxxdc                   
                                  ;ccccdxxoc;,;cc                   
                                 cocccldxkk;                        
                                ''ollcclxxxkx:               ;codc   
                                ,cooolllddoodc''           ;odlclo,  
                              ''l::c:llc::::::llc:''   '':ldxdo:,''     
                  '';cl:;:    ;l;;cc::cc::cooooddxddloxxO0Oo''        
                '',,,,,cdOx;;:cc;;clc:loxxdllcccloddddxkldOOk''       
            cdxxkkkO00OO000l:lc;cllclxkkkxxxOOkxdloxccxkkkkO;       
         :odlcldkOOOOOOOOOOc:lc:::cdxxxxxxxkkO0kcloodxkkkkko        
      ,c:, '':okkkkxddkOOOOOl:ccc;;lxxxxxxxxxkOkkoocokkxxkx;         
         ,okkkxdc::oxkOOOO0xc:cllccoxOkkxxxkkkkkkllodool:           
       ''lkkxo:  cxxookOOOO0Oxoc::clllooooldkkkocol;,                
      :xkkl''  ,do; ,xdxOOkOxxxxkdddl,''     ;xk,                     
     :xOo''   :l''   l;cc:clxxdddc;,,:c:,''     ''                      
    :xo''    ,,    ,''      lddx,    ,'' ,::,                          
   ''l                     lddl         :cl,                         
                         ''kdo       :ccc:;                          
                         ldo,       '',''''                            
                         ldo                                        
                          ::                                        
                          ,;                                        
                         '':c                                        
                           :,                                       
                           ;:                                       
                         '';;;::::c:,                                
                               '',;,''                                
                                                                    
','
                                                                    
                                                                    
                                                                    
                                           ''''                       
                                        ;oxxxxl                     
                                       lxxxxxxx:                    
                                      ;xxxxxxx:                     
                                      okkkkxxxl''                    
                                    ,cdkxdkOxxd,                    
                                  :cccolclldxxxl                    
                                 ;lcccdxocll:;cl:                   
                                 lccccdxx;                          
                                ;lcccoxxkd;                         
                               ,ollcclxxkxxl                 ,:c''   
                              '':cc:lolodocclo:,''           :docoo''  
                             :c;:::;cc::;;;;:clc:;   ,;:okxdol:;,   
                            :c:;::c::ccoollllooddodddxklxOOo        
                 '';clox0klc;cc:::ccloxkOkdddllcllooolcxo:xkOc       
              ,cldxkOO0000d:cc::;:oxxxxxxxkkO0kocod::cxkkOxOo       
            cxkkOOOOkkkkOOx::c:;;:dxxxxxxxkxkkxcclodxkkkkkkx,       
         ,oxkkkkkkdclokOOOOd:;cc::okkxxxxkkkkOxldcokkxkkkko         
        lxxkkkko;'';okOOOOOOkdl:;:ccokkxxxxxOkkocclllcll:;           
      ,coxkkkd; ;dkocdkkOOxxxxxolllc,,   ''xkl'' ''''                   
      ;oxkko, ''dxc  dx:lldxxkOko:,''       ;''                        
     ''oc,cl   ll   ''d''   odkkl;'',;;,,::;;;,''                        
    ''o,  :   ,l    '':   :ddd:,'' ''''        ;::                       
    ;        ''          odd,              ,c:;                      
                       cxo:                ''''                       
                       dol                                          
                       ;l:                                          
                       '':                                           
                       ''c                                           
                      '':c                                           
                       ,c                                           
                       ;:;                                          
                     ,,,,;ccccc;                                    
                           '',''''                                     
                                                                    
','
                                                                    
                                                                    
                                                                    
                                    ,codddoc                        
                                   ;xxxxxxxd''                       
                                   :xxxxxxc                         
                                   ''xxxxxxdo:                       
                                   ,xkkxkkxxl''                      
                                  ,cdoloooddxo''                     
                                ,cccoxlc:lc,'';                      
                                :cccoxxl                            
                               cocccoxxxo                           
                               llcccoxxkxd                  ,;      
                              ;ocllccoddool,             ,loloc     
                           ,l::c:;ccc::::::llc;''       ,cdooccl''    
                          ;c:;::c;:c::::ccccccc:c:;:ldxdOko,        
               ''coxkxkd:;;:c;;ccc::lodkxddlllloddooo::x;lkOd''       
            :odxkkOO000Ol:cc:::::coxkkkkkkkkkxllloc:''''xkxOkO:       
          lxxkOOOkkkkkkkl::cc:;;:dxxxxxxxxxkkxllc:ooxxkkkkxx''       
         lxkOOkkdl::dOOOOl;:cc:;lxxxxxxxxxkkOkdo:lxkkxkxxx:         
        lxxkkxo'' ''cxOOOOOOdc::cclxxkkkkkkxkOkdcccoxddolc''           
       cdoxkkd  lxkddxxOOkxxdoccccc:;:llloxkx:;;;,                  
       :''okxd  oxx:;xkkOOxxxxkkko;        c:                        
         dxxc ''xx'' ok:lxxdxkkkxl                                    
        ,d'':c  xl  l;  ;ddo:ddd,                                    
        ''c  ;  ol  ;   odo  ldx;   '';;::;::;,                       
         ''     '':     :xd;  cdll:;,:       ''cc;                     
                     ;ddl   '',              ;c:;                    
                     cdo                                            
                      :;                                            
                     '':                                             
                   '',::                                             
                     :,                                             
                     ;''                                             
                   ,::;,,                                           
                      ;clocc;                                       
                                                                    
                                                                    
','
                                                                    
                                                                    
                                   ;:;                              
                                 :dxxxl                             
                                ;xxxxxl'',                           
                                ;xkxxxxxx:                          
                                 lxxkkkxkkl,                        
                                 ''dkkkxkkkxxo                       
                                 ''xxdooollc''                        
                                ;ccdoc:::;                          
                               cl:coxxo                             
                              :l::clxxxl''                           
                              cccc:lxxxkx:                 ;:l,     
                            ,,clcoolloxddd:''             cdococ     
                          ;lc:c:;:ccccc:::lllc,     ,clxOxoo::;     
               ,;:cdl:  ,:l:;cc:;;:c:cclloooodooooodxkdOOkc         
            '';:lddxO0Oxc:cc::clc:lddxkOkkOkoloddodo:;xlokOkl        
          :dkxoldkOOOOo;:ccc::codxxxxxxxxkkkkllodl::;xkOOkkx        
         okd:;lxxkxxxkd::ccc;;cxxxxxxxxxkkkOdclc:odkkkkkkxo''        
        od:;oxxl:,:ldOOd::cc:;cxkxxxxxkkxkOOdcl:cxkxkkkkd:          
       lo''lxxo'' ;dkkkOkOkdcccccldkkxO0kdxkkkocccodoodl:''            
      ''l :xxl  oxklldkkO0kxdllloolooc::;;co:;:;;,                   
         oko  :xx:''dkdkkkdxxxxxxxdc;                                
         okc  :xl ;xc'':lxddxkkkkx;                                  
         cx:  ;d; ''l   oddl'' ''oxd:                                  
         ''o    d,  ,  cxol     ldo,                                 
          :''   ,,    ''ddl       ldo,                                
                    ;xdo         lxoc,                              
                    ,dl           ''   ,lc:;,''                       
                    ,:                '',   :c:;,                    
                    :,                    ''''  ,ll;                  
                  ;c;                          ''col:;''              
                   :''                            '',,,,              
                  ::                                                
               '';cc:;''                                              
                  '':clocc,                                          
                    '''''' ''                                           
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                              '':c,                                  
                              ldxx:                                 
                              lxxxxlc''                              
                              ,xxxxxxdlll''                          
                               ;oxxxxxxxx''                          
                                 ;xkkkxxd;                          
                                 ;kkdolll:                          
                                  lxxdldo                           
                                 ;loxxxxo                 '',        
                                ,l:lxxxkxd:             clodo       
                  ,''            coccdxxxxxxd;         ;ddocll''      
                   :oc;     '';cloodllodddolldol:,'',:lxO0k:''         
            '',,;;;;;:dOd,'';collc;;cclllloollcloddxxdOxdkOx:         
        ,:oxkkkxxkOOOOOklccc:cl:::cxxdolllloddddodlckkdOkOx         
      :xxocccllodkOOOOkc:cc:cllc:cdxkkkxkkxdxdooccocxOOOkkl         
    :oc,'',cdxkkdlldkOkd;:cc;:::cdxxxxxxkkO00xcl:cdkkkkkkx:          
   ''''  cxkxxl;'';lxOkkOkc:ccc::;:dkxxxxxkxkkOdloldkkkkkko            
     ;xkxd:  ,dkko:cokkxoc:llc::cxOOkkkkxkkOdc:ldoc:;''              
    cxkd:   lxd: ,dxl;;cdo:lccclloxOxxxkxkxc,,,''                    
   ;ddl    lo,   dl'' '':,  cxxdddxxxxd;,,oo''                         
   c      cc    c,       cddxxxkkxxx:                               
          c    '':      ,oddo;  ''ldddc                               
                      cxdo,      cdol                               
                    :dxo:         cdd;                              
                   ;xd:            cdo                              
                   ;:               odc                             
                ''::,                ,ldl                            
                '':''                    c:                           
               ;:''                      :c,                         
            ;;:::                      ,,,:c,                       
              ,::;                         ,c:;,,coo:,              
               ::cl:;                     ,;,,'''',,,;,;              
                 '',,;''                                              
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                               ,;,                                  
                              cxxxd:                                
                              ''dxxxxc                               
                               ''oxxkkxoc;                           
                                 ''cdkkxxxo;                         
                                   dkxxddol                         
                                   lxlcclc,                         
                                   ;oxddxx''                         
                                  clcdxxkkdo''            ;:ldo,     
                                 cc:cdxxxxxxl          ,odlcco:     
                               ''coollloxxdcldd:,   '';lxOkd:,''       
                  ,:c:,,    '':l:c:;clllooolc;cddddddkxxO0x;         
             '',,,,,,,:dOx:,:cc;ccc:cdxdlllllldddoxdoOxoOOOk;        
         ;cdxkkkkOOO0OOOOd:cc;:ll::oxxxxxxkdoololoc:kkOOxkk;        
      ;oxdodOO0OOOOkkkOOx::cc;:ccoxxxxxxxxk0kolc:oxdkOkkxxc         
   ,lc:;:cdkkkkxxxkOOOOOx::lc::;;oxxxxxxxkkOklocokxxkxxkx,          
      :dxkkxl::coxkkkOOOkl;:cc:;;lxOOkkkxkOOdl:coxoodcc,            
    cdxkko:  :dkdc;coxkkOko:::cccccdkxdkkdlc:;;;''                   
   oxldl,  :do;  ,odc;ldccxxdollllool::xc                           
  oc      ll''   lo;  '''' ,odddlokxxxx,                               
 ,,      :;    ,,      lddd:   ''dxdd,                               
                     ;oxo:       ood;                               
                   ;ddo,         ''dol                               
                   lo:            ;dd:                              
                '' ;:               cod,                             
                ;c''                 :lo                             
               ,:''                    ;:                            
           '',,;:                       ::                           
             ::;                      '',,:,                         
             ::c                         '':;,,coo:,''                
             c:ll:''                     ,;,,'''''''',,''                 
              '',;,                                                  
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                              '';;;,                                 
                             :xxxxkxc''                              
                              '';lxkkkxc;                            
                                 ;dxkkxkd;                          
                                  ''dkkkxxk:                         
                                   ddollcc                          
                                   cxdooxo                          
                                 ''lclxxxkxl,                        
                                 :::cdxkkkxx:            '';cox;     
                                colcccdkkxddd:''         odoccoo     
                               ,oloolllodolclollc,  ,:okkdoc;''      
                  ,,;;;c;   ''clcc:;clclllcc::ccoxddxxkkO0k;         
                '':loxOOOOOo:lo:llc:lxOkxddddxkxxddxdxkcokOkc        
             :oxkkkOOOOOOkccoc:clloxxxxxxkOO0kddoldcoOxkkkOo        
          :dkkOOOOkkxkkkko;clc;;:oxxxxxxxxkkOdcl:cxxxkkkkkk:        
       ,ldloxOkkxdlok00OOx::lc:;;okkxxxxxkOOkooooxxxxkxxxo''         
     ''lc;cxkkkd:,;okOOOOOOd::clc::dOxdkkkkk0olc:lxxkkdol;           
    '', :dkkdc'' ;oxxlcoxkkOOxc::ccllodoollxl;;;,,''                   
      cxkxl   cxxl'':xxoldlxxxdoooloodc,                             
     lxxd,   ldc'' ;dc  '' odddc:okxxdo                               
    cd;,    cd,   o,   :ddd:    ,xddl                               
   ''l       d,        lxo:       ;doo                               
            ''       ldo;          cdd;                              
                    o:             ooc                              
                 '',:               :dd''                             
                 :;                 ,l;                             
              '',:,                   '':''                            
              ,;:                    ,c:                            
             ,;:''                      ;;                           
            :cc:                        ::,,:oo:,''                  
           ''ccll:                     '';,'''''''',,,,''                  
             '''',''                                                   
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                               ,;::''                                
                              lxxxkko:                              
                               ,;dkkkkxo:''                          
                                 ''dxkkkkkxc                         
                                   lkkkxxdl                         
                                   ;xxolcc:''                        
                                    cxxooxo                         
                                    llxxkkxl                        
                                   ,l:dxkkkkd''                      
                                  :l::lxkkkxxo''            ;:cdo''   
                                 ;dollllddlllodl:,      '';xdlcldl   
                              :::cc:lllccccc:;collllcclxOkxdc;,     
                   '';:ldkc'' :oc::ll:codxkkkdlclddxxxdxxokOko        
               ,:coxkOOO00xccl::llcldxkkkkkOkkxddddxodx:dxOk;       
             cxxkkOOOOOOOOl:lc::;cxxxxxxxkOO0KxxdlcddkkOOxkO;       
           ,dkkO0OkkkOOOOOd:ccc:;lxxxxxkkkkOOOxlddxkkkkkxxko        
          ,ddxOOkkxdxOOOOOko::clccoxOOxdllodkOkxokkkkkkkkl''         
         ,lcdkkxkllkOxxkkOOkllc::cccoddolcc:ldolclccc:,             
         , lxkko'':xxcoxkoxkooddddoooodl,,''                          
          ;xxkl  ox::OOOdxddoc;,:dxxxd                              
          ll l  ''do d0xdl;''      ,xodc                              
          o'' ,   d; lll,          lod,                              
          ;      c  '' ;,          cdd''                              
                      ;:          :do''                              
                      ,c''         ''dd''                              
                       :;          ,o;                              
                      ,:;           ;;                              
                    '';:c;           ;c''                             
                     ;cc           '';c,                             
                  '',:cc,             ''c''                            
                 ;:lo:;              ''::;,,:lc,                     
                   ,''               ,,''  '''',,,,,                    
                                                                    
                                                                    
','
                                                                    
                                                                    
                                                                    
                                                                    
                               cddo:                                
                                oxkxxxc                             
                                 oxkkkxoolc;                        
                                 ,dxxkkkkkxx,                       
                                   :dkkkkxxd                        
                                    okxdoclc''                       
                                    ''ddolll;                        
                                    ''ldxxxxl                        
                                    cllxxkkkdc                 ,''   
                                   cc:coxxkkkkl            ''clldo''  
                               ,:;:lllllldxdooxdc;''      ,cddoclo,  
                    ,:llo;  '';cc;:c:;cccccoolodlccollcldxOkOo,''     
               ;cdxOO00000kc:cc;;:cc:clloxkkOkxddxxxddxk;lkOk,      
             cxkkOOkkOkkOOx::c:;:cllldxkxxkkOkxOOxooo:lkxdkkkc      
            lxO00kkd:clkOOx::cc;;;:dkxxxxxxxkkO0kd:cdxkkxkkxk:      
           ''xxxOkkocokOxdkOl;:c::;cxkxxxxxxkxkxolllxxkkkxxxxc       
           ''x:okxlcxkd:ldxOko::ccccokkkkOkOxocloc:oxkkkxxo:         
            c''oxx:dxo,okkddOOkolccllodxkxol;,,;;;:;,,''              
              :xx;dxdokkkxxxxxxxxxxxxddo:                           
              ''dd''lo'':dol:,,'''',cxxddxd,                             
               ,l  c  :  :,,::'',oxdd:                               
                ''           ;:::ldd:                                
                           ''  '':cxl                                 
                          c:c;:coo                                  
                            '',odd:                                  
                               cd,                                  
                                :''                                  
                                ,''                                  
                               ''::                                  
                                 ,,                                 
                                 '':,,;:ll;''                         
                                ,,'''''''''',,,,                         
                                                                    
                                                                    
'];

  LOOP
    RAISE NOTICE '%', cat[i];
    perform pg_sleep(0.1);
    i := (i % 18)+1;

  END LOOP;


END;
$function$;


select whistlestop();
