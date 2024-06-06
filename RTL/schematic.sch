# File saved with Nlview 7.5.8 2022-09-21 7111 VDI=41 GEI=38 GUI=JA:10.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new protected work:protected:NOFILE
load symbol FDCE hdi_primitives GEN pin Q output.right pin C input.clk.left pin CE input.left pin CLR input.left pin D input.left fillcolor 1
load symbol LUT6 hdi_primitives BOX pin O output.right pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left pin I4 input.left pin I5 input.left fillcolor 1
load symbol LUT5 hdi_primitives BOX pin O output.right pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left pin I4 input.left fillcolor 1
load symbol LUT4 hdi_primitives BOX pin O output.right pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left fillcolor 1
load symbol DSP48E2 {hdi_primitives:abstract:no file specified} HIERBOX pin CARRYCASCOUT output.right pin MULTSIGNOUT output.right pin OVERFLOW output.right pin PATTERNBDETECT output.right pin PATTERNDETECT output.right pin UNDERFLOW output.right pin CARRYCASCIN input.left pin CARRYIN input.left pin CEA1 input.left pin CEA2 input.left pin CEAD input.left pin CEALUMODE input.left pin CEB1 input.left pin CEB2 input.left pin CEC input.left pin CECARRYIN input.left pin CECTRL input.left pin CED input.left pin CEINMODE input.left pin CEM input.left pin CEP input.left pin CLK input.left pin MULTSIGNIN input.left pin RSTA input.left pin RSTALLCARRYIN input.left pin RSTALUMODE input.left pin RSTB input.left pin RSTC input.left pin RSTCTRL input.left pin RSTD input.left pin RSTINMODE input.left pin RSTM input.left pin RSTP input.left pinBus ACOUT output.right [29:0] pinBus BCOUT output.right [17:0] pinBus CARRYOUT output.right [3:0] pinBus PCOUT output.right [47:0] pinBus P output.right [47:0] pinBus XOROUT output.right [7:0] pinBus ACIN input.left [29:0] pinBus ALUMODE input.left [3:0] pinBus A input.left [29:0] pinBus BCIN input.left [17:0] pinBus B input.left [17:0] pinBus CARRYINSEL input.left [2:0] pinBus C input.left [47:0] pinBus D input.left [26:0] pinBus INMODE input.left [4:0] pinBus OPMODE input.left [8:0] pinBus PCIN input.left [47:0] fillcolor 2
load symbol DSP_A_B_DATA hdi_primitives BOX pin CEA1 input.left pin CEA2 input.left pin CEB1 input.left pin CEB2 input.left pin CLK input.left pin RSTA input.left pin RSTB input.left pinBus A1_DATA output.right [26:0] pinBus A2_DATA output.right [26:0] pinBus ACOUT output.right [29:0] pinBus A_ALU output.right [29:0] pinBus B1_DATA output.right [17:0] pinBus B2_DATA output.right [17:0] pinBus BCOUT output.right [17:0] pinBus B_ALU output.right [17:0] pinBus ACIN input.left [29:0] pinBus A input.left [29:0] pinBus BCIN input.left [17:0] pinBus B input.left [17:0] fillcolor 1
load symbol DSP_PREADD_DATA hdi_primitives BOX pin ADDSUB output.right pin INMODE_2 output.right pin CEAD input.left pin CED input.left pin CEINMODE input.left pin CLK input.left pin RSTD input.left pin RSTINMODE input.left pinBus A2A1 output.right [26:0] pinBus AD_DATA output.right [26:0] pinBus B2B1 output.right [17:0] pinBus D_DATA output.right [26:0] pinBus PREADD_AB output.right [26:0] pinBus A1_DATA input.left [26:0] pinBus A2_DATA input.left [26:0] pinBus AD input.left [26:0] pinBus B1_DATA input.left [17:0] pinBus B2_DATA input.left [17:0] pinBus DIN input.left [26:0] pinBus INMODE input.left [4:0] fillcolor 1
load symbol DSP_MULTIPLIER hdi_primitives BOX pin AMULT26 output.right pin BMULT17 output.right pinBus U output.right [44:0] pinBus V output.right [44:0] pinBus A2A1 input.left [26:0] pinBus AD_DATA input.left [26:0] pinBus B2B1 input.left [17:0] fillcolor 1
load symbol DSP_M_DATA hdi_primitives BOX pin CEM input.left pin CLK input.left pin RSTM input.left pinBus U_DATA output.right [44:0] pinBus V_DATA output.right [44:0] pinBus U input.left [44:0] pinBus V input.left [44:0] fillcolor 1
load symbol DSP_ALU hdi_primitives BOX pin ALUMODE10 output.right pin MULTSIGN_ALU output.right pin AMULT26 input.left pin BMULT17 input.left pin CARRYCASCIN input.left pin CARRYIN input.left pin CCOUT input.left pin CEALUMODE input.left pin CECARRYIN input.left pin CECTRL input.left pin CEM input.left pin CLK input.left pin MULTSIGNIN input.left pin P_FDBK_47 input.left pin RSTALLCARRYIN input.left pin RSTALUMODE input.left pin RSTCTRL input.left pinBus ALU_OUT output.right [47:0] pinBus COUT output.right [3:0] pinBus XOR_MX output.right [7:0] pinBus ALUMODE input.left [3:0] pinBus A_ALU input.left [29:0] pinBus B_ALU input.left [17:0] pinBus CARRYINSEL input.left [2:0] pinBus C_DATA input.left [47:0] pinBus OPMODE input.left [8:0] pinBus PCIN input.left [47:0] pinBus P_FDBK input.left [47:0] pinBus U_DATA input.left [44:0] pinBus V_DATA input.left [44:0] fillcolor 1
load symbol DSP_OUTPUT hdi_primitives BOX pin CARRYCASCOUT output.right pin CCOUT_FB output.right pin MULTSIGNOUT output.right pin OVERFLOW output.right pin PATTERN_B_DETECT output.right pin PATTERN_DETECT output.right pin P_FDBK_47 output.right pin UNDERFLOW output.right pin ALUMODE10 input.left pin CEP input.left pin CLK input.left pin MULTSIGN_ALU input.left pin RSTP input.left pinBus CARRYOUT output.right [3:0] pinBus PCOUT output.right [47:0] pinBus P output.right [47:0] pinBus P_FDBK output.right [47:0] pinBus XOROUT output.right [7:0] pinBus ALU_OUT input.left [47:0] pinBus COUT input.left [3:0] pinBus C_DATA input.left [47:0] pinBus XOR_MX input.left [7:0] fillcolor 1
load symbol LUT3 hdi_primitives BOX pin O output.right pin I0 input.left pin I1 input.left pin I2 input.left fillcolor 1
load symbol CARRY8 hdi_primitives BOX pin CI input.left pin CI_TOP input.left pinBus CO output.right [7:0] pinBus O output.right [7:0] pinBus DI input.left [7:0] pinBus S input.left [7:0] fillcolor 1
load symbol LUT2 hdi_primitives BOX pin O output.right pin I0 input.left pin I1 input.left fillcolor 1
load inst j_reg[27] FDCE hdi_primitives -attr @cell(#000000) FDCE -pg 1 -lvl 1 -x 20 -y 530
load inst temp2__41_i_88 LUT6 hdi_primitives -attr @cell(#000000) LUT6 -pg 1 -lvl 2 -x 140 -y 420
load inst temp2__41_i_37 LUT5 hdi_primitives -attr @cell(#000000) LUT5 -pg 1 -lvl 3 -x 280 -y 460
load inst temp2__42_i_12 LUT4 hdi_primitives -attr @cell(#000000) LUT4 -pg 1 -lvl 4 -x 420 -y 440
load inst temp2__45 DSP48E2 {hdi_primitives:abstract:no file specified} -autohide -attr @cell(#000000) DSP48E2 -attr @fillcolor #fafafa -pinAttr CARRYCASCOUT @attr n/c -pinAttr MULTSIGNOUT @attr n/c -pinAttr OVERFLOW @attr n/c -pinAttr PATTERNBDETECT @attr n/c -pinAttr PATTERNDETECT @attr n/c -pinAttr UNDERFLOW @attr n/c -pinBusAttr ACOUT @name ACOUT[29:0] -pinBusAttr ACOUT @attr n/c -pinBusAttr BCOUT @name BCOUT[17:0] -pinBusAttr BCOUT @attr n/c -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr CARRYOUT @attr n/c -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr XOROUT @attr n/c -pinBusAttr ACIN @name ACIN[29:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A @name A[29:0] -pinBusAttr BCIN @name BCIN[17:0] -pinBusAttr B @name B[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C @name C[47:0] -pinBusAttr D @name D[26:0] -pinBusAttr INMODE @name INMODE[4:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"000000101\" -pinBusAttr PCIN @name PCIN[47:0] -pg 1 -lvl 5 -x 580 -y 120
load inst temp2__45|DSP_A_B_DATA_INST DSP_A_B_DATA hdi_primitives -hier temp2__45 -attr @name DSP_A_B_DATA_INST -attr @cell(#000000) DSP_A_B_DATA -pinBusAttr A1_DATA @name A1_DATA[26:0] -pinBusAttr A2_DATA @name A2_DATA[26:0] -pinBusAttr ACOUT @name ACOUT[29:0] -pinBusAttr A_ALU @name A_ALU[29:0] -pinBusAttr B1_DATA @name B1_DATA[17:0] -pinBusAttr B2_DATA @name B2_DATA[17:0] -pinBusAttr BCOUT @name BCOUT[17:0] -pinBusAttr B_ALU @name B_ALU[17:0] -pinBusAttr ACIN @name ACIN[29:0] -pinBusAttr A @name A[29:0] -pinBusAttr BCIN @name BCIN[17:0] -pinBusAttr B @name B[17:0] -pg 1 -lvl 1 -x 620 -y 420
load inst temp2__45|DSP_PREADD_DATA_INST DSP_PREADD_DATA hdi_primitives -hier temp2__45 -attr @name DSP_PREADD_DATA_INST -attr @cell(#000000) DSP_PREADD_DATA -pinBusAttr A2A1 @name A2A1[26:0] -pinBusAttr AD_DATA @name AD_DATA[26:0] -pinBusAttr B2B1 @name B2B1[17:0] -pinBusAttr D_DATA @name D_DATA[26:0] -pinBusAttr PREADD_AB @name PREADD_AB[26:0] -pinBusAttr A1_DATA @name A1_DATA[26:0] -pinBusAttr A2_DATA @name A2_DATA[26:0] -pinBusAttr AD @name AD[26:0] -pinBusAttr B1_DATA @name B1_DATA[17:0] -pinBusAttr B2_DATA @name B2_DATA[17:0] -pinBusAttr DIN @name DIN[26:0] -pinBusAttr INMODE @name INMODE[4:0] -pg 1 -lvl 2 -x 840 -y 500
load inst temp2__45|DSP_MULTIPLIER_INST DSP_MULTIPLIER hdi_primitives -hier temp2__45 -attr @name DSP_MULTIPLIER_INST -attr @cell(#000000) DSP_MULTIPLIER -pinBusAttr U @name U[44:0] -pinBusAttr V @name V[44:0] -pinBusAttr A2A1 @name A2A1[26:0] -pinBusAttr AD_DATA @name AD_DATA[26:0] -pinBusAttr B2B1 @name B2B1[17:0] -pg 1 -lvl 3 -x 1080 -y 580
load inst temp2__45|DSP_M_DATA_INST DSP_M_DATA hdi_primitives -hier temp2__45 -attr @name DSP_M_DATA_INST -attr @cell(#000000) DSP_M_DATA -pinBusAttr U_DATA @name U_DATA[44:0] -pinBusAttr V_DATA @name V_DATA[44:0] -pinBusAttr U @name U[44:0] -pinBusAttr V @name V[44:0] -pg 1 -lvl 4 -x 1300 -y 560
load inst temp2__45|DSP_ALU_INST DSP_ALU hdi_primitives -hier temp2__45 -attr @name DSP_ALU_INST -attr @cell(#000000) DSP_ALU -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A_ALU @name A_ALU[29:0] -pinBusAttr B_ALU @name B_ALU[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"000000101\" -pinBusAttr PCIN @name PCIN[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr U_DATA @name U_DATA[44:0] -pinBusAttr V_DATA @name V_DATA[44:0] -pg 1 -lvl 5 -x 1570 -y 120
load inst temp2__45|DSP_OUTPUT_INST DSP_OUTPUT hdi_primitives -hier temp2__45 -attr @name DSP_OUTPUT_INST -attr @cell(#000000) DSP_OUTPUT -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pg 1 -lvl 6 -x 1790 -y 280
load inst temp2__46 DSP48E2 {hdi_primitives:abstract:no file specified} -autohide -attr @cell(#000000) DSP48E2 -attr @fillcolor #fafafa -pinAttr CARRYCASCOUT @attr n/c -pinAttr MULTSIGNOUT @attr n/c -pinAttr OVERFLOW @attr n/c -pinAttr PATTERNBDETECT @attr n/c -pinAttr PATTERNDETECT @attr n/c -pinAttr UNDERFLOW @attr n/c -pinBusAttr ACOUT @name ACOUT[29:0] -pinBusAttr ACOUT @attr n/c -pinBusAttr BCOUT @name BCOUT[17:0] -pinBusAttr BCOUT @attr n/c -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr CARRYOUT @attr n/c -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr P @attr n/c -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr XOROUT @attr n/c -pinBusAttr ACIN @name ACIN[29:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A @name A[29:0] -pinBusAttr BCIN @name BCIN[17:0] -pinBusAttr B @name B[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C @name C[47:0] -pinBusAttr D @name D[26:0] -pinBusAttr INMODE @name INMODE[4:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"001010101\" -pinBusAttr PCIN @name PCIN[47:0] -pg 1 -lvl 6 -x 2210 -y 100
load inst temp2__46|DSP_ALU_INST DSP_ALU hdi_primitives -hier temp2__46 -attr @name DSP_ALU_INST -attr @cell(#000000) DSP_ALU -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A_ALU @name A_ALU[29:0] -pinBusAttr B_ALU @name B_ALU[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"001010101\" -pinBusAttr PCIN @name PCIN[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr U_DATA @name U_DATA[44:0] -pinBusAttr V_DATA @name V_DATA[44:0] -pg 1 -lvl 1 -x 2330 -y 100
load inst temp2__46|DSP_OUTPUT_INST DSP_OUTPUT hdi_primitives -hier temp2__46 -attr @name DSP_OUTPUT_INST -attr @cell(#000000) DSP_OUTPUT -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pg 1 -lvl 2 -x 2550 -y 260
load inst temp2__47 DSP48E2 {hdi_primitives:abstract:no file specified} -autohide -attr @cell(#000000) DSP48E2 -attr @fillcolor #fafafa -pinAttr CARRYCASCOUT @attr n/c -pinAttr MULTSIGNOUT @attr n/c -pinAttr OVERFLOW @attr n/c -pinAttr PATTERNBDETECT @attr n/c -pinAttr PATTERNDETECT @attr n/c -pinAttr UNDERFLOW @attr n/c -pinBusAttr ACOUT @name ACOUT[29:0] -pinBusAttr ACOUT @attr n/c -pinBusAttr BCOUT @name BCOUT[17:0] -pinBusAttr BCOUT @attr n/c -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr CARRYOUT @attr n/c -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr XOROUT @attr n/c -pinBusAttr ACIN @name ACIN[29:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A @name A[29:0] -pinBusAttr BCIN @name BCIN[17:0] -pinBusAttr B @name B[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C @name C[47:0] -pinBusAttr D @name D[26:0] -pinBusAttr INMODE @name INMODE[4:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"000010101\" -pinBusAttr PCIN @name PCIN[47:0] -pg 1 -lvl 7 -x 2970 -y 80
load inst temp2__47|DSP_ALU_INST DSP_ALU hdi_primitives -hier temp2__47 -attr @name DSP_ALU_INST -attr @cell(#000000) DSP_ALU -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A_ALU @name A_ALU[29:0] -pinBusAttr B_ALU @name B_ALU[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"000010101\" -pinBusAttr PCIN @name PCIN[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr U_DATA @name U_DATA[44:0] -pinBusAttr V_DATA @name V_DATA[44:0] -pg 1 -lvl 1 -x 3090 -y 80
load inst temp2__47|DSP_OUTPUT_INST DSP_OUTPUT hdi_primitives -hier temp2__47 -attr @name DSP_OUTPUT_INST -attr @cell(#000000) DSP_OUTPUT -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pg 1 -lvl 2 -x 3310 -y 240
load inst temp2__48 DSP48E2 {hdi_primitives:abstract:no file specified} -autohide -attr @cell(#000000) DSP48E2 -attr @fillcolor #fafafa -pinAttr CARRYCASCOUT @attr n/c -pinAttr MULTSIGNOUT @attr n/c -pinAttr OVERFLOW @attr n/c -pinAttr PATTERNBDETECT @attr n/c -pinAttr PATTERNDETECT @attr n/c -pinAttr UNDERFLOW @attr n/c -pinBusAttr ACOUT @name ACOUT[29:0] -pinBusAttr ACOUT @attr n/c -pinBusAttr BCOUT @name BCOUT[17:0] -pinBusAttr BCOUT @attr n/c -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr CARRYOUT @attr n/c -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr PCOUT @attr n/c -pinBusAttr P @name P[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr XOROUT @attr n/c -pinBusAttr ACIN @name ACIN[29:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A @name A[29:0] -pinBusAttr BCIN @name BCIN[17:0] -pinBusAttr B @name B[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C @name C[47:0] -pinBusAttr D @name D[26:0] -pinBusAttr INMODE @name INMODE[4:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"001010101\" -pinBusAttr PCIN @name PCIN[47:0] -pg 1 -lvl 8 -x 3730 -y 60
load inst temp2__48|DSP_ALU_INST DSP_ALU hdi_primitives -hier temp2__48 -attr @name DSP_ALU_INST -attr @cell(#000000) DSP_ALU -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pinBusAttr ALUMODE @name ALUMODE[3:0] -pinBusAttr A_ALU @name A_ALU[29:0] -pinBusAttr B_ALU @name B_ALU[17:0] -pinBusAttr CARRYINSEL @name CARRYINSEL[2:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr OPMODE @name OPMODE[8:0] -pinBusAttr OPMODE @attr V=B\"001010101\" -pinBusAttr PCIN @name PCIN[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr U_DATA @name U_DATA[44:0] -pinBusAttr V_DATA @name V_DATA[44:0] -pg 1 -lvl 1 -x 3850 -y 60
load inst temp2__48|DSP_OUTPUT_INST DSP_OUTPUT hdi_primitives -hier temp2__48 -attr @name DSP_OUTPUT_INST -attr @cell(#000000) DSP_OUTPUT -pinBusAttr CARRYOUT @name CARRYOUT[3:0] -pinBusAttr PCOUT @name PCOUT[47:0] -pinBusAttr P @name P[47:0] -pinBusAttr P_FDBK @name P_FDBK[47:0] -pinBusAttr XOROUT @name XOROUT[7:0] -pinBusAttr ALU_OUT @name ALU_OUT[47:0] -pinBusAttr COUT @name COUT[3:0] -pinBusAttr C_DATA @name C_DATA[47:0] -pinBusAttr XOR_MX @name XOR_MX[7:0] -pg 1 -lvl 2 -x 4070 -y 220
load inst output_mul[63]_i_16 LUT3 hdi_primitives -attr @cell(#000000) LUT3 -pg 1 -lvl 9 -x 4430 -y 280
load inst output_mul[63]_i_21 LUT4 hdi_primitives -attr @cell(#000000) LUT4 -pg 1 -lvl 10 -x 4590 -y 240
load inst output_mul_reg[63]_i_12 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 11 -x 4740 -y 200
load inst output_mul_reg[71]_i_11 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 12 -x 4940 -y 220
load inst output_mul_reg[71]_i_10 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 13 -x 5140 -y 240
load inst output_mul_reg[87]_i_11 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 14 -x 5340 -y 260
load inst output_mul_reg[95]_i_11 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 15 -x 5540 -y 280
load inst output_mul_reg[103]_i_22 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 16 -x 5740 -y 300
load inst output_mul_reg[103]_i_13 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 17 -x 5940 -y 320
load inst output_mul_reg[103]_i_12 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 18 -x 6140 -y 340
load inst output_mul_reg[152]_i_53 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr CO @attr n/c -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 19 -x 6340 -y 360
load inst output_mul[127]_i_33 LUT2 hdi_primitives -attr @cell(#000000) LUT2 -pg 1 -lvl 20 -x 6560 -y 400
load inst output_mul_reg[127]_i_29 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 21 -x 6720 -y 340
load inst output_mul_reg[135]_i_27 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 22 -x 6920 -y 360
load inst output_mul_reg[143]_i_27 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 23 -x 7120 -y 380
load inst output_mul_reg[151]_i_27 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 24 -x 7320 -y 400
load inst output_mul_reg[152]_i_40 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 25 -x 7520 -y 420
load inst output_mul_reg[152]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 26 -x 7720 -y 440
load inst output_mul_reg[1461]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 27 -x 7930 -y 460
load inst output_mul_reg[1469]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 28 -x 8150 -y 480
load inst output_mul_reg[1477]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 29 -x 8370 -y 500
load inst output_mul_reg[1485]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 30 -x 8590 -y 520
load inst output_mul_reg[1493]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 31 -x 8810 -y 540
load inst output_mul_reg[1501]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 32 -x 9030 -y 560
load inst output_mul_reg[1509]_i_37 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 33 -x 9250 -y 580
load inst output_mul_reg[1535]_i_64 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 34 -x 9470 -y 600
load inst output_mul[1535]_i_32 LUT3 hdi_primitives -attr @cell(#000000) LUT3 -pg 1 -lvl 35 -x 9700 -y 640
load inst output_mul[1535]_i_40 LUT4 hdi_primitives -attr @cell(#000000) LUT4 -pg 1 -lvl 36 -x 9880 -y 600
load inst output_mul_reg[1535]_i_18 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 37 -x 10050 -y 560
load inst output_mul[1517]_i_20 LUT5 hdi_primitives -attr @cell(#000000) LUT5 -pg 1 -lvl 38 -x 10280 -y 520
load inst output_mul[490]_i_8 LUT3 hdi_primitives -attr @cell(#000000) LUT3 -pg 1 -lvl 39 -x 10450 -y 520
load inst output_mul_reg[490]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 40 -x 10600 -y 480
load inst output_mul_reg[498]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 41 -x 10800 -y 500
load inst output_mul_reg[506]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 42 -x 11000 -y 520
load inst output_mul_reg[514]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 43 -x 11200 -y 540
load inst output_mul_reg[522]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 44 -x 11400 -y 560
load inst output_mul_reg[530]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 45 -x 11600 -y 580
load inst output_mul_reg[538]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 46 -x 11800 -y 600
load inst output_mul_reg[546]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 47 -x 12000 -y 620
load inst output_mul_reg[554]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 48 -x 12200 -y 640
load inst output_mul_reg[562]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 49 -x 12400 -y 660
load inst output_mul_reg[570]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 50 -x 12600 -y 680
load inst output_mul_reg[578]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 51 -x 12800 -y 700
load inst output_mul_reg[586]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 52 -x 13000 -y 720
load inst output_mul_reg[594]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 53 -x 13200 -y 740
load inst output_mul_reg[602]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 54 -x 13400 -y 760
load inst output_mul_reg[610]_i_2 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 55 -x 13600 -y 780
load inst output_mul_reg[611]_i_5 CARRY8 hdi_primitives -attr @cell(#000000) CARRY8 -pinBusAttr CO @name CO[7:0] -pinBusAttr O @name O[7:0] -pinBusAttr DI @name DI[7:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 56 -x 13800 -y 800
load inst output_mul[671]_i_2 LUT5 hdi_primitives -attr @cell(#000000) LUT5 -pg 1 -lvl 57 -x 14010 -y 760
load inst output_mul[1012]_i_2 LUT5 hdi_primitives -attr @cell(#000000) LUT5 -pg 1 -lvl 58 -x 14180 -y 780
load inst output_mul[1283]_i_3 LUT5 hdi_primitives -attr @cell(#000000) LUT5 -pg 1 -lvl 59 -x 14360 -y 800
load inst output_mul[1274]_i_1 LUT3 hdi_primitives -attr @cell(#000000) LUT3 -pg 1 -lvl 60 -x 14540 -y 820
load inst output_mul_reg[1274] FDCE hdi_primitives -attr @cell(#000000) FDCE -pg 1 -lvl 61 -x 14720 -y 820
load net j_reg_n_0_[27] -attr @style dashed -attr @rip(#000000) 5 -pin j_reg[27] Q -pin temp2__41_i_88 I5
netloc j_reg_n_0_[27] 1 1 1 NJ 530
load net temp2__41_i_88_n_0 -pin temp2__41_i_37 I0 -pin temp2__41_i_88 O
netloc temp2__41_i_88_n_0 1 2 1 NJ 470
load net temp2__41_i_37_n_0 -attr @style dashed -pin temp2__41_i_37 O -pin temp2__42_i_12 I3
netloc temp2__41_i_37_n_0 1 3 1 NJ 510
load net temp2__45|B[5] -attr @name B[5] -attr @rip(#000000) B[5] -hierPin temp2__45 B[5] -pin temp2__45|DSP_A_B_DATA_INST B[5]
netloc temp2__45|B[5] 1 0 1 NJ 470
load net temp2__42_i_12_n_0 -attr @style dashed -attr @rip(#000000) 5 -pin temp2__42_i_12 O -pin temp2__45 B[5]
netloc temp2__42_i_12_n_0 1 4 1 NJ 470
load net temp2__45|DSP_A_B_DATA.B2_DATA<5> -attr @name DSP_A_B_DATA.B2_DATA<5> -attr @rip(#000000) B2_DATA[5] -pin temp2__45|DSP_A_B_DATA_INST B2_DATA[5] -pin temp2__45|DSP_PREADD_DATA_INST B2_DATA[5]
netloc temp2__45|DSP_A_B_DATA.B2_DATA<5> 1 1 1 NJ 590
load net temp2__45|DSP_PREADD_DATA.B2B1<5> -attr @name DSP_PREADD_DATA.B2B1<5> -attr @rip(#000000) B2B1[5] -pin temp2__45|DSP_MULTIPLIER_INST B2B1[5] -pin temp2__45|DSP_PREADD_DATA_INST B2B1[5]
netloc temp2__45|DSP_PREADD_DATA.B2B1<5> 1 2 1 NJ 630
load net temp2__45|DSP_MULTIPLIER.U<36> -attr @name DSP_MULTIPLIER.U<36> -attr @rip(#000000) U[36] -pin temp2__45|DSP_MULTIPLIER_INST U[36] -pin temp2__45|DSP_M_DATA_INST U[36]
netloc temp2__45|DSP_MULTIPLIER.U<36> 1 3 1 NJ 630
load net temp2__45|DSP_M_DATA.U_DATA<36> -attr @name DSP_M_DATA.U_DATA<36> -attr @rip(#000000) U_DATA[36] -pin temp2__45|DSP_ALU_INST U_DATA[36] -pin temp2__45|DSP_M_DATA_INST U_DATA[36]
netloc temp2__45|DSP_M_DATA.U_DATA<36> 1 4 1 NJ 590
load net temp2__45|DSP_ALU.ALU_OUT<47> -attr @name DSP_ALU.ALU_OUT<47> -attr @rip(#000000) ALU_OUT[47] -pin temp2__45|DSP_ALU_INST ALU_OUT[47] -pin temp2__45|DSP_OUTPUT_INST ALU_OUT[47]
netloc temp2__45|DSP_ALU.ALU_OUT<47> 1 5 1 NJ 350
load net temp2__46|PCIN[47] -attr @name PCIN[47] -attr @rip(#000000) PCIN[47] -hierPin temp2__46 PCIN[47] -pin temp2__46|DSP_ALU_INST PCIN[47]
netloc temp2__46|PCIN[47] 1 0 1 NJ 450
load net temp2__45_n_106 -attr @rip(#000000) PCOUT[47] -pin temp2__45 PCOUT[47] -pin temp2__46 PCIN[47]
netloc temp2__45_n_106 1 5 1 NJ 450
load net temp2__45|PCOUT[47] -attr @name PCOUT[47] -attr @rip(#000000) PCOUT[47] -hierPin temp2__45 PCOUT[47] -pin temp2__45|DSP_OUTPUT_INST PCOUT[47]
netloc temp2__45|PCOUT[47] 1 6 1 NJ 450
load net temp2__46|DSP_ALU.ALU_OUT<47> -attr @name DSP_ALU.ALU_OUT<47> -attr @rip(#000000) ALU_OUT[47] -pin temp2__46|DSP_ALU_INST ALU_OUT[47] -pin temp2__46|DSP_OUTPUT_INST ALU_OUT[47]
netloc temp2__46|DSP_ALU.ALU_OUT<47> 1 1 1 NJ 330
load net temp2__47|PCIN[47] -attr @name PCIN[47] -attr @rip(#000000) PCIN[47] -hierPin temp2__47 PCIN[47] -pin temp2__47|DSP_ALU_INST PCIN[47]
netloc temp2__47|PCIN[47] 1 0 1 NJ 430
load net temp2__46_n_106 -attr @rip(#000000) PCOUT[47] -pin temp2__46 PCOUT[47] -pin temp2__47 PCIN[47]
netloc temp2__46_n_106 1 6 1 NJ 430
load net temp2__46|PCOUT[47] -attr @name PCOUT[47] -attr @rip(#000000) PCOUT[47] -hierPin temp2__46 PCOUT[47] -pin temp2__46|DSP_OUTPUT_INST PCOUT[47]
netloc temp2__46|PCOUT[47] 1 2 1 NJ 430
load net temp2__47|DSP_ALU.ALU_OUT<47> -attr @name DSP_ALU.ALU_OUT<47> -attr @rip(#000000) ALU_OUT[47] -pin temp2__47|DSP_ALU_INST ALU_OUT[47] -pin temp2__47|DSP_OUTPUT_INST ALU_OUT[47]
netloc temp2__47|DSP_ALU.ALU_OUT<47> 1 1 1 NJ 310
load net temp2__48|PCIN[47] -attr @name PCIN[47] -attr @rip(#000000) PCIN[47] -hierPin temp2__48 PCIN[47] -pin temp2__48|DSP_ALU_INST PCIN[47]
netloc temp2__48|PCIN[47] 1 0 1 NJ 410
load net temp2__47_n_106 -attr @rip(#000000) PCOUT[47] -pin temp2__47 PCOUT[47] -pin temp2__48 PCIN[47]
netloc temp2__47_n_106 1 7 1 NJ 410
load net temp2__47|PCOUT[47] -attr @name PCOUT[47] -attr @rip(#000000) PCOUT[47] -hierPin temp2__47 PCOUT[47] -pin temp2__47|DSP_OUTPUT_INST PCOUT[47]
netloc temp2__47|PCOUT[47] 1 2 1 NJ 410
load net temp2__48|DSP_ALU.ALU_OUT<18> -attr @name DSP_ALU.ALU_OUT<18> -attr @rip(#000000) ALU_OUT[18] -pin temp2__48|DSP_ALU_INST ALU_OUT[18] -pin temp2__48|DSP_OUTPUT_INST ALU_OUT[18]
netloc temp2__48|DSP_ALU.ALU_OUT<18> 1 1 1 NJ 290
load net temp2__48_n_87 -attr @style dashed -attr @rip(#000000) P[18] -pin output_mul[63]_i_16 I2 -pin temp2__48 P[18]
netloc temp2__48_n_87 1 8 1 NJ 330
load net temp2__48|P[18] -attr @name P[18] -attr @rip(#000000) P[18] -hierPin temp2__48 P[18] -pin temp2__48|DSP_OUTPUT_INST P[18]
netloc temp2__48|P[18] 1 2 1 NJ 330
load net output_mul[63]_i_16_n_0 -attr @style dashed -attr @rip(#000000) 4 -pin output_mul[63]_i_16 O -pin output_mul[63]_i_21 I3
netloc output_mul[63]_i_16_n_0 1 9 1 NJ 310
load net output_mul[63]_i_21_n_0 -attr @rip(#000000) 4 -pin output_mul[63]_i_21 O -pin output_mul_reg[63]_i_12 S[4]
netloc output_mul[63]_i_21_n_0 1 10 1 NJ 270
load net output_mul_reg[63]_i_12_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[63]_i_12 CO[7] -pin output_mul_reg[71]_i_11 CI
netloc output_mul_reg[63]_i_12_n_0 1 11 1 NJ 230
load net output_mul_reg[71]_i_11_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[71]_i_10 CI -pin output_mul_reg[71]_i_11 CO[7]
netloc output_mul_reg[71]_i_11_n_0 1 12 1 NJ 250
load net output_mul_reg[71]_i_10_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[71]_i_10 CO[7] -pin output_mul_reg[87]_i_11 CI
netloc output_mul_reg[71]_i_10_n_0 1 13 1 NJ 270
load net output_mul_reg[87]_i_11_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[87]_i_11 CO[7] -pin output_mul_reg[95]_i_11 CI
netloc output_mul_reg[87]_i_11_n_0 1 14 1 NJ 290
load net output_mul_reg[95]_i_11_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[103]_i_22 CI -pin output_mul_reg[95]_i_11 CO[7]
netloc output_mul_reg[95]_i_11_n_0 1 15 1 NJ 310
load net output_mul_reg[103]_i_22_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[103]_i_13 CI -pin output_mul_reg[103]_i_22 CO[7]
netloc output_mul_reg[103]_i_22_n_0 1 16 1 NJ 330
load net output_mul_reg[103]_i_13_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[103]_i_12 CI -pin output_mul_reg[103]_i_13 CO[7]
netloc output_mul_reg[103]_i_13_n_0 1 17 1 NJ 350
load net output_mul_reg[103]_i_12_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[103]_i_12 CO[7] -pin output_mul_reg[152]_i_53 CI
netloc output_mul_reg[103]_i_12_n_0 1 18 1 NJ 370
load net output_mul_reg[152]_i_53_n_12 -attr @style dashed -attr @rip(#000000) O[3] -pin output_mul[127]_i_33 I0 -pin output_mul_reg[152]_i_53 O[3]
netloc output_mul_reg[152]_i_53_n_12 1 19 1 NJ 410
load net output_mul[127]_i_33_n_0 -attr @rip(#000000) 5 -pin output_mul[127]_i_33 O -pin output_mul_reg[127]_i_29 S[5]
netloc output_mul[127]_i_33_n_0 1 20 1 NJ 410
load net output_mul_reg[127]_i_29_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[127]_i_29 CO[7] -pin output_mul_reg[135]_i_27 CI
netloc output_mul_reg[127]_i_29_n_0 1 21 1 NJ 370
load net output_mul_reg[135]_i_27_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[135]_i_27 CO[7] -pin output_mul_reg[143]_i_27 CI
netloc output_mul_reg[135]_i_27_n_0 1 22 1 NJ 390
load net output_mul_reg[143]_i_27_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[143]_i_27 CO[7] -pin output_mul_reg[151]_i_27 CI
netloc output_mul_reg[143]_i_27_n_0 1 23 1 NJ 410
load net output_mul_reg[151]_i_27_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[151]_i_27 CO[7] -pin output_mul_reg[152]_i_40 CI
netloc output_mul_reg[151]_i_27_n_0 1 24 1 NJ 430
load net output_mul_reg[152]_i_40_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[152]_i_37 CI -pin output_mul_reg[152]_i_40 CO[7]
netloc output_mul_reg[152]_i_40_n_0 1 25 1 NJ 450
load net output_mul_reg[152]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1461]_i_37 CI -pin output_mul_reg[152]_i_37 CO[7]
netloc output_mul_reg[152]_i_37_n_0 1 26 1 NJ 470
load net output_mul_reg[1461]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1461]_i_37 CO[7] -pin output_mul_reg[1469]_i_37 CI
netloc output_mul_reg[1461]_i_37_n_0 1 27 1 NJ 490
load net output_mul_reg[1469]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1469]_i_37 CO[7] -pin output_mul_reg[1477]_i_37 CI
netloc output_mul_reg[1469]_i_37_n_0 1 28 1 NJ 510
load net output_mul_reg[1477]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1477]_i_37 CO[7] -pin output_mul_reg[1485]_i_37 CI
netloc output_mul_reg[1477]_i_37_n_0 1 29 1 NJ 530
load net output_mul_reg[1485]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1485]_i_37 CO[7] -pin output_mul_reg[1493]_i_37 CI
netloc output_mul_reg[1485]_i_37_n_0 1 30 1 NJ 550
load net output_mul_reg[1493]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1493]_i_37 CO[7] -pin output_mul_reg[1501]_i_37 CI
netloc output_mul_reg[1493]_i_37_n_0 1 31 1 NJ 570
load net output_mul_reg[1501]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1501]_i_37 CO[7] -pin output_mul_reg[1509]_i_37 CI
netloc output_mul_reg[1501]_i_37_n_0 1 32 1 NJ 590
load net output_mul_reg[1509]_i_37_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[1509]_i_37 CO[7] -pin output_mul_reg[1535]_i_64 CI
netloc output_mul_reg[1509]_i_37_n_0 1 33 1 NJ 610
load net output_mul_reg[1535]_i_64_n_10 -attr @style dashed -attr @rip(#000000) O[5] -pin output_mul[1535]_i_32 I0 -pin output_mul_reg[1535]_i_64 O[5]
netloc output_mul_reg[1535]_i_64_n_10 1 34 1 NJ 650
load net output_mul[1535]_i_32_n_0 -attr @style dashed -attr @rip(#000000) 3 -pin output_mul[1535]_i_32 O -pin output_mul[1535]_i_40 I3
netloc output_mul[1535]_i_32_n_0 1 35 1 NJ 670
load net output_mul[1535]_i_40_n_0 -attr @rip(#000000) 3 -pin output_mul[1535]_i_40 O -pin output_mul_reg[1535]_i_18 S[3]
netloc output_mul[1535]_i_40_n_0 1 36 1 NJ 630
load net output_mul_reg[1535]_i_18_n_8 -attr @style dashed -attr @rip(#000000) O[7] -pin output_mul[1517]_i_20 I4 -pin output_mul_reg[1535]_i_18 O[7]
netloc output_mul_reg[1535]_i_18_n_8 1 37 1 NJ 610
load net output_mul[1517]_i_20_n_0 -attr @style dashed -pin output_mul[1517]_i_20 O -pin output_mul[490]_i_8 I2
netloc output_mul[1517]_i_20_n_0 1 38 1 NJ 570
load net output_mul[490]_i_8_n_0 -attr @rip(#000000) 3 -pin output_mul[490]_i_8 O -pin output_mul_reg[490]_i_2 S[3]
netloc output_mul[490]_i_8_n_0 1 39 1 NJ 550
load net output_mul_reg[490]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[490]_i_2 CO[7] -pin output_mul_reg[498]_i_2 CI
netloc output_mul_reg[490]_i_2_n_0 1 40 1 NJ 510
load net output_mul_reg[498]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[498]_i_2 CO[7] -pin output_mul_reg[506]_i_2 CI
netloc output_mul_reg[498]_i_2_n_0 1 41 1 NJ 530
load net output_mul_reg[506]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[506]_i_2 CO[7] -pin output_mul_reg[514]_i_2 CI
netloc output_mul_reg[506]_i_2_n_0 1 42 1 NJ 550
load net output_mul_reg[514]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[514]_i_2 CO[7] -pin output_mul_reg[522]_i_2 CI
netloc output_mul_reg[514]_i_2_n_0 1 43 1 NJ 570
load net output_mul_reg[522]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[522]_i_2 CO[7] -pin output_mul_reg[530]_i_2 CI
netloc output_mul_reg[522]_i_2_n_0 1 44 1 NJ 590
load net output_mul_reg[530]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[530]_i_2 CO[7] -pin output_mul_reg[538]_i_2 CI
netloc output_mul_reg[530]_i_2_n_0 1 45 1 NJ 610
load net output_mul_reg[538]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[538]_i_2 CO[7] -pin output_mul_reg[546]_i_2 CI
netloc output_mul_reg[538]_i_2_n_0 1 46 1 NJ 630
load net output_mul_reg[546]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[546]_i_2 CO[7] -pin output_mul_reg[554]_i_2 CI
netloc output_mul_reg[546]_i_2_n_0 1 47 1 NJ 650
load net output_mul_reg[554]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[554]_i_2 CO[7] -pin output_mul_reg[562]_i_2 CI
netloc output_mul_reg[554]_i_2_n_0 1 48 1 NJ 670
load net output_mul_reg[562]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[562]_i_2 CO[7] -pin output_mul_reg[570]_i_2 CI
netloc output_mul_reg[562]_i_2_n_0 1 49 1 NJ 690
load net output_mul_reg[570]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[570]_i_2 CO[7] -pin output_mul_reg[578]_i_2 CI
netloc output_mul_reg[570]_i_2_n_0 1 50 1 NJ 710
load net output_mul_reg[578]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[578]_i_2 CO[7] -pin output_mul_reg[586]_i_2 CI
netloc output_mul_reg[578]_i_2_n_0 1 51 1 NJ 730
load net output_mul_reg[586]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[586]_i_2 CO[7] -pin output_mul_reg[594]_i_2 CI
netloc output_mul_reg[586]_i_2_n_0 1 52 1 NJ 750
load net output_mul_reg[594]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[594]_i_2 CO[7] -pin output_mul_reg[602]_i_2 CI
netloc output_mul_reg[594]_i_2_n_0 1 53 1 NJ 770
load net output_mul_reg[602]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[602]_i_2 CO[7] -pin output_mul_reg[610]_i_2 CI
netloc output_mul_reg[602]_i_2_n_0 1 54 1 NJ 790
load net output_mul_reg[610]_i_2_n_0 -attr @rip(#000000) CO[7] -pin output_mul_reg[610]_i_2 CO[7] -pin output_mul_reg[611]_i_5 CI
netloc output_mul_reg[610]_i_2_n_0 1 55 1 NJ 810
load net output_mul_reg[611]_i_5_n_6 -attr @style dashed -attr @rip(#000000) CO[1] -pin output_mul[671]_i_2 I3 -pin output_mul_reg[611]_i_5 CO[1]
netloc output_mul_reg[611]_i_5_n_6 1 56 1 NJ 830
load net output_mul[671]_i_2_n_0 -attr @style dashed -pin output_mul[1012]_i_2 I1 -pin output_mul[671]_i_2 O
netloc output_mul[671]_i_2_n_0 1 57 1 NJ 810
load net output_mul[1012]_i_2_n_0 -attr @style dashed -pin output_mul[1012]_i_2 O -pin output_mul[1283]_i_3 I1
netloc output_mul[1012]_i_2_n_0 1 58 1 NJ 830
load net output_mul[1283]_i_3_n_0 -attr @style dashed -pin output_mul[1274]_i_1 I1 -pin output_mul[1283]_i_3 O
netloc output_mul[1283]_i_3_n_0 1 59 1 NJ 850
load net output_mul[1274]_i_1_n_0 -pin output_mul[1274]_i_1 O -pin output_mul_reg[1274] D
netloc output_mul[1274]_i_1_n_0 1 60 1 NJ 850
levelinfo -pg 1 0 20 140 280 420 580 2210 2970 3730 4430 4590 4740 4940 5140 5340 5540 5740 5940 6140 6340 6560 6720 6920 7120 7320 7520 7720 7930 8150 8370 8590 8810 9030 9250 9470 9700 9880 10050 10280 10450 10600 10800 11000 11200 11400 11600 11800 12000 12200 12400 12600 12800 13000 13200 13400 13600 13800 14010 14180 14360 14540 14720 14840
levelinfo -hier temp2__45 * 620 840 1080 1300 1570 1790 *
levelinfo -hier temp2__46 * 2330 2550 *
levelinfo -hier temp2__47 * 3090 3310 *
levelinfo -hier temp2__48 * 3850 4070 *
pagesize -pg 1 -db -bbox -sgen 0 0 14840 930
pagesize -hier temp2__45 -db -bbox -sgen 580 90 2040 790
pagesize -hier temp2__46 -db -bbox -sgen 2210 70 2800 630
pagesize -hier temp2__47 -db -bbox -sgen 2970 50 3560 610
pagesize -hier temp2__48 -db -bbox -sgen 3730 30 4320 590
show
zoom 0.129406
scrollpos 0 -336
#
# initialize ictrl to current module protected work:protected:NOFILE
ictrl init topinfo |
