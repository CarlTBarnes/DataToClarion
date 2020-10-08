  PROGRAM

  INCLUDE('StringTheory.inc'),ONCE

!Data to Clarion - Compile formatted text (or whatever) into your Clarion app without all of the fuss.
!Requires StringTheory if you want to to be able to decompress the data or compile this application.
!https://www.capesoft.com/accessories/StringTheorysp.htm

! Modified 10/8/2020 by Carl Barnes 
!   Repeat Last Encode so can try different parameters

!Region License
! * Created with Clarion 10
! * User: jslarve
! * Date: 5/25/2019
! * Time: 12:00 PM
!MIT License
!
!Copyright (c) 2019 Jeff Slarve
!
!Permission is hereby granted, free of charge, to any person obtaining a copy
!of this software and associated documentation files (the "Software"), to deal
!in the Software without restriction, including without limitation the rights
!to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
!copies of the Software, and to permit persons to whom the Software is
!furnished to do so, subject to the following conditions:
!
!The above copyright notice and this permission notice shall be included in all
!copies or substantial portions of the Software.
!
!THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
!IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
!FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
!AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
!LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
!OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
!SOFTWARE.
!endRegion License

!Region Strings
!Below, is the MIT license processed with this program.
MyLicense    STRING('<01fH,08bH,008H,000H,000H,000H,000H,000H,000H,00bH,05cH,052H,0ddH,06fH,09bH>' &|
                    '<030H,010H,07fH,047H,0e2H,07fH,038H,0e5H,0a9H,095H,050H,0f7H,0f1H,0b6H,0bdH>' &|
                    '<039H,0e0H,034H,0deH,000H,047H,0c6H,069H,096H,047H,002H,026H,078H,022H,038H>' &|
                    '<0c2H,0ceH,0aaH,0feH,0f7H,0bbH,023H,069H,0bbH,04eH,08aH,014H,0f9H,0eeH,07eH>' &|
                    '<05fH,077H,014H,042H,043H,06eH,01bH,033H,07aH,013H,047H,071H,094H,0baH,0f3H>' &|
                    '<0cbH,064H,08fH,07dH,080H,0bbH,0e6H,01eH,0beH,07eH,0feH,0f2H,00dH,07eH,098H>' &|
                    '<0aeH,083H,06aH,0a8H,0a7H,03fH,0f3H,0c4H,0c6H,04cH,027H,0ebH,0bdH,075H,023H>' &|
                    '<058H,00fH,0bdH,099H,0ccH,0e1H,005H,08eH,053H,03dH,006H,0d3H,026H,0d0H,04dH>' &|
                    '<0c6H,080H,0ebH,0a0H,0e9H,0ebH,0e9H,068H,012H,008H,00eH,0eaH,0f1H,005H,0ceH>' &|
                    '<066H,0f2H,008H,070H,087H,050H,0dbH,0d1H,08eH,047H,0a8H,0a1H,041H,0a5H,038H>' &|
                    '<0c2H,0d1H,0d0H,023H,08fH,077H,05dH,078H,0aeH,027H,083H,0d3H,02dH,0d4H,0deH>' &|
                    '<0bbH,0c6H,0d6H,048H,008H,0adH,06bH,02eH,027H,033H,086H,03aH,090H,060H,067H>' &|
                    '<007H,0e3H,0e1H,02eH,0f4H,006H,016H,0d5H,00dH,0b1H,0b8H,09fH,055H,05aH,053H>' &|
                    '<00fH,071H,064H,047H,0a0H,0e6H,06bH,00fH,09eH,06dH,0e8H,0ddH,025H,0c0H,064H>' &|
                    '<07cH,098H,06cH,043H,024H,009H,0d8H,0b1H,019H,02eH,02dH,0b9H,078H,06dH,00fH>' &|
                    '<0f6H,064H,06fH,012H,004H,09fH,017H,0e0H,0e3H,008H,069H,02fH,01eH,043H,090H>' &|
                    '<0d5H,004H,04eH,0aeH,0b5H,01dH,0fdH,09bH,039H,0d9H,0f9H,072H,018H,0acH,0efH>' &|
                    '<013H,068H,02dH,071H,01fH,02eH,001H,08bH,09eH,08aH,0f3H,032H,013H,04aH,0f2H>' &|
                    '<0c9H,04dH,0e0H,0cdH,080H,0c6H,090H,0c2H,0a2H,0f5H,039H,0eeH,0bbH,0bfH,079H>' &|
                    '<088H,0dcH,09fH,069H,0a9H,0e1H,0b6H,026H,04fH,095H,0e7H,0deH,09dH,03eH,066H>' &|
                    '<0b1H,0e8H,0a8H,0bbH,04cH,023H,08aH,09aH,019H,0d4H,03aH,05cH,0dbH,0acH,0f9H>' &|
                    '<0dbH,034H,081H,02aH,034H,0dfH,0b9H,061H,070H,0cfH,094H,0aeH,071H,063H,06bH>' &|
                    '<029H,094H,0ffH,04eH,087H,0d3H,0d8H,0acH,00fH,0eeH,08fH,099H,0f3H,05cH,08fH>' &|
                    '<03cH,0baH,080H,076H,0afH,02eH,0e8H,00cH,0e7H,0f7H,0e3H,0deH,05aH,0beH,0afH>' &|
                    '<087H,001H,00eH,0e6H,0b6H,035H,054H,0c6H,01dH,0d7H,0ffH,046H,09aH,0c8H,081H>' &|
                    '<00fH,0f8H,001H,0d8H,07aH,080H,0b3H,09bH,066H,0c9H,0ffH,0a3H,03eH,0ccH,016H>' &|
                    '<0d6H,01cH,02aH,0b9H,0d2H,03bH,0a6H,038H,088H,00aH,036H,04aH,03eH,089H,08cH>' &|
                    '<067H,0b0H,060H,015H,0beH,017H,009H,0ecH,084H,05eH,0cbH,0adH,006H,09cH,050H>' &|
                    '<0acH,0d4H,07bH,090H,02bH,060H,0e5H,01eH,07eH,08aH,032H,04bH,080H,0ffH,0daH>' &|
                    '<028H,05eH,055H,020H,055H,01cH,089H,062H,093H,00bH,08eH,045H,051H,0a6H,0f9H>' &|
                    '<036H,013H,0e5H,023H,02cH,011H,058H,04aH,0fcH,09eH,045H,021H,034H,0b2H,06aH>' &|
                    '<009H,0a4H,078H,0e3H,012H,0bcH,022H,0b6H,082H,0abH,074H,08dH,04fH,0b6H,014H>' &|
                    '<0b9H,0d0H,0fbH,024H,08eH,056H,042H,097H,0c4H,0baH,092H,00aH,018H,06cH,098H>' &|
                    '<0d2H,022H,0ddH,0e6H,04cH,0c1H,066H,0abH,036H,0b2H,0e2H,068H,020H,043H,0deH>' &|
                    '<052H,094H,02bH,085H,032H,0bcH,0e0H,0a5H,07eH,040H,059H,0acH,001H,07fH,0c2H>' &|
                    '<007H,054H,06bH,096H,0e7H,0a4H,015H,047H,06cH,08bH,001H,014H,059H,084H,054H>' &|
                    '<06eH,0f6H,04aH,03cH,0aeH,035H,0acH,065H,09eH,071H,02cH,02eH,039H,07aH,063H>' &|
                    '<0cbH,09cH,05fH,0b5H,030H,057H,09aH,033H,051H,024H,090H,0b1H,082H,03dH,0f2H>' &|
                    '<019H,025H,091H,006H,0e3H,0d1H,0dcH,0d5H,020H,0ecH,0d6H,09cH,06aH,0a4H,0c8H>' &|
                    '<0f0H,097H,06aH,021H,04bH,04aH,092H,0caH,052H,02bH,07cH,026H,018H,054H,0e9H>' &|
                    '<037H,0ecH,04eH,054H,03cH,001H,0a6H,044H,045H,03bH,059H,029H,059H,060H,046H>' &|
                    '<0daH,029H,042H,0e4H,0ccH,082H,0c0H,092H,05fH,069H,068H,0dfH,0f0H,0e1H,02cH>' &|
                    '<038H,042H,0efH,06dH,0c5H,0dfH,018H,021H,0e3H,02cH,047H,0b2H,08aH,0c0H,073H>' &|
                    '<0caH,0d7H,0e9H,087H,0bfH,000H,000H,000H,0ffH,0ffH>')

!The Instructions string is compressed RTF (from Instructions.rtf)
Instructions    STRING('<01fH,08bH,008H,000H,000H,000H,000H,000H,000H,00bH,06cH,051H,0cdH,08aH,0dcH>' &|
                       '<030H,00cH,0eeH,079H,061H,0dfH,041H,0c7H,0b6H,0b4H,0c1H,049H,0a6H,05dH,0daH>' &|
                       '<01eH,0cbH,016H,07aH,0d9H,096H,065H,08eH,0baH,038H,089H,092H,088H,07aH,0e4H>' &|
                       '<060H,02bH,033H,03bH,00cH,0f3H,0eeH,0b5H,093H,014H,0baH,030H,060H,084H,0b0H>' &|
                       '<0f5H,0fdH,0c9H,017H,00cH,0daH,097H,068H,025H,0f2H,052H,0daH,069H,028H,0abH>' &|
                       '<04fH,015H,076H,0d4H,0f7H,006H,0c5H,0cfH,0dcH,0faH,0c3H,064H,035H,05fH,038H>' &|
                       '<02bH,043H,069H,0eaH,0faH,082H,0bdH,017H,0d5H,0c6H,0a5H,0c6H,060H,02fH,0ecH>' &|
                       '<0b0H,06fH,047H,01bH,022H,0a9H,081H,0efH,0d6H,071H,013H,0f8H,0dbH,0f5H,07aH>' &|
                       '<07fH,077H,0c1H,0f7H,038H,090H,050H,0b0H,0eaH,003H,03cH,073H,03bH,052H,057H>' &|
                       '<019H,028H,04dH,061H,08aH,0f2H,0a1H,0acH,077H,057H,03cH,032H,09dH,0feH,0b0H>' &|
                       '<074H,03bH,09cH,0dbH,012H,0eeH,0efH,070H,0b2H,0a1H,083H,00cH,09dH,044H,0e9H>' &|
                       '<045H,093H,002H,094H,005H,0aaH,06dH,0aeH,099H,06dH,092H,074H,0dcH,0d1H,035H>' &|
                       '<0beH,03bH,0a7H,02eH,0c9H,04fH,092H,0d0H,024H,09aH,0bbH,0a8H,036H,068H,099H>' &|
                       '<09aH,08eH,0daH,085H,0e0H,045H,06dH,091H,08dH,060H,0cfH,01fH,0ebH,0cfH,006H>' &|
                       '<01dH,03fH,054H,006H,0a3H,0adH,04cH,0aaH,0aeH,0daH,0e5H,07aH,098H,05dH,0c2H>' &|
                       '<0e4H,020H,031H,0bdH,0e5H,08cH,05fH,0e0H,051H,05aH,0dfH,011H,09cH,0fdH,01cH>' &|
                       '<0a0H,0b3H,06aH,061H,08eH,02cH,003H,078H,021H,0f0H,03dH,0e8H,048H,060H,01bH>' &|
                       '<07fH,024H,068H,066H,055H,02fH,0b1H,0c8H,0aeH,05fH,07bH,0aeH,056H,0cfH,0bfH>' &|
                       '<06dH,054H,002H,056H,060H,051H,0ffH,01fH,05fH,0a4H,056H,0d9H,0cbH,00dH,060H>' &|
                       '<0bdH,002H,07fH,0f6H,079H,01aH,0f2H,0f2H,003H,0c5H,048H,0ddH,0a2H,0baH,060H>' &|
                       '<07dH,0e0H,081H,0c5H,03aH,077H,0feH,0b0H,0ccH,008H,0e5H,057H,00fH,029H,0f4H>' &|
                       '<036H,0bdH,00aH,0c2H,092H,0c1H,046H,088H,0a3H,03fH,049H,0beH,0d0H,091H,023H>' &|
                       '<04cH,0c1H,00fH,0c1H,01eH,06eH,048H,0efH,056H,0e9H,027H,07fH,05aH,078H,047H>' &|
                       '<07bH,0dcH,056H,010H,035H,0e4H,0f8H,049H,063H,08eH,0f4H,08fH,079H,023H,0d8H>' &|
                       '<0beH,0ecH,0e6H,052H,01bH,064H,078H,0fbH,0f4H,06bH,0ffH,0f8H,015H,0f6H,059H>' &|
                       '<03aH,09dH,0e7H,0fdH,08fH,025H,014H,0bbH,064H,07aH,059H,04aH,0ceH,0b5H,079H>' &|
                       '<07aH,087H,08dH,041H,036H,02bH,071H,0faH,0b6H,037H,07fH,001H,000H,000H,0ffH>' &|
                       '<0ffH>')
!endRegion License    
    MAP
Main                   Procedure()
        MODULE('RTL')
            LtoA(LONG num ,*CSTRING s, SIGNED radix),ULONG,RAW,NAME('_ltoa'),PROC
        END
    END

    CODE
    Main()
        
Main                PROCEDURE

DataLabel           STRING(60) !The label of your variable
DataType            STRING(60) !Would typically be a STRING, or EQUATE. CSTRING is not recommended because there could be NULL characters. 
MaxWidth            SHORT      !Max characters wide (in the editor)
ST                  StringTheory !Main StringTheory object
stLastTime          StringTheory !Repeat Last Button
FileName            STRING(FILE:MaxFilePath) !File to be loaded, if applicable
CompressData        BYTE       !If we're going to gzip/gunzip
MyLicenseString     STRING(1500) !Gunzipped license string
InstructionText     STRING(1000) !Gunzipped instructions RTF

Window WINDOW('Encode for Clarion'),AT(,,567,245),CENTER,GRAY,SYSTEM,ICON(ICON:NextPage),FONT('Segoe UI',8)
        PROMPT('Data &Label:'),AT(5,6),USE(?DataLabelPrompt)
        ENTRY(@s60),AT(49,4,153),USE(DataLabel)
        PROMPT('Data &Type:'),AT(5,20),USE(?DataTypePrompt)
        ENTRY(@s60),AT(49,20,153),USE(DataType)
        PROMPT('Max &Width:'),AT(5,36),USE(?MaxWidthPrompt)
        SPIN(@n3),AT(49,36,26),USE(MaxWidth),RIGHT,RANGE(40,999)
        CHECK('C&ompress'),AT(81,37),USE(CompressData)
        BUTTON('Encode &File...'),AT(3,67),USE(?EncodeFileButton)
        BUTTON('Encode &Clipboard'),AT(68,67),USE(?EncodeClipboardButton)
        BUTTON('Repeat Last'),AT(151,67),USE(?EncodeLastTimeButton),DISABLE
        BUTTON('&Close'),AT(507,227,57,14),USE(?CloseButton),STD(STD:Close)
        GROUP,AT(209,4,354,219),USE(?GROUP1),BOXED,BEVEL(0,0,6666H)
            PROMPT('The text below was encoded with this program (with "compress" enabled) and compiled into the data se' & |
                    'ction.'),AT(217,7,320,17),USE(?PROMPT1)
            TEXT,AT(215,28,343,188),USE(MyLicenseString),VSCROLL,COLOR(COLOR:BTNFACE),READONLY
        END
        TEXT,AT(5,86,199,137),USE(InstructionText),VSCROLL,COLOR(COLOR:BTNFACE),READONLY,RTF(TEXT:FIELD)
    END

    CODE
    !Going to read the gzipped strings that we compiled (using this program)
    ST.SetValue(MyLicense)!Temporarily use the StringTheory object to decompress the compiled string
    ST.gzipped = TRUE     !Set this property so StringTheory knows it is ok to perform the gunzip
    ST.gunzip             !Perform the gUnzip
    MyLicenseString = ST.GetValue() !Copy the string
    ST.SetValue(Instructions)       !Now we're reading the RTF instructions 
    ST.gzipped = TRUE     !Set this property so StringTheory knows it is ok to perform the gunzip
    ST.gunzip             !Perform the gUnzip
    InstructionText = ST.GetValue() !Copy the string
    ST.gzipped = FALSE    !Reset the flag 
    ST.SetValue('')       !Clearing out the ST object for further use
    
    DataLabel = 'MyField' !Default value
    DataType  = 'STRING'  !Default value
    MaxWidth  = 80        !Default value

    OPEN(Window)
    ACCEPT
        CASE ACCEPTED()
        OF ?EncodeFileButton
            IF FileDialog('Select File to Encode...',FileName,'*.*', FILE:LongName)
                ST.Start()
                IF ~ST.LoadFile(CLIP(FileName)) THEN !Open the file with StringTheory object 
                    Message('Load File Failed Error ' & St.winErrorCode &' '* st.FormatMessage(St.winErrorCode))
                    CYCLE 
                END
                DO EncodeTheData            
            END                
        OF ?EncodeClipboardButton 
            ST.Start()
            ST.SetValue(CLIPBOARD()) !Set the StringTheory object to what's in the clipboard
            DO EncodeTheData
        OF ?EncodeLastTimeButton 
            ST.Start()
            ST.SetValue(stLastTime) 
            DO EncodeTheData  
        END
    END
        
EncodeTheData        ROUTINE 
    IF ST.Length() < 1 THEN
       Message('There is No Data to Encode.','DataToCw')
       EXIT 
    END
    stLastTime.SetValue(ST) 
    ENABLE(?EncodeLastTimeButton)
    ?EncodeLastTimeButton{PROP:Tip}='Repeat the '& FORMAT(CLOCK(),@t3) &' Encode of '& St.Length() &' bytes'
   
    IF CompressData !This is where we compress the data
        ST.gzip(9)
    END

    !If you want to ENCRYPT the data, do that here. Not before the compress.
    
    SETCLIPBOARD(Format4Clarion(ST.GetValue(),CLIP(DataLabel),CLIP(DataType),MaxWidth)) !Set the clipboard with the results
    ST.Start()  !was ST.SetValue('') ; ST.gzipped = FALSE !Reset the StringTheory object to accept non-compressed data
    
    MESSAGE('Paste the contents of your clipboard to the data section of your code editor.')

Format4Clarion    Procedure(String pString,<String pLabel>,<String pDataType>,Long pMaxWidth=80)!,STRING
PAD_SIZE                EQUATE(5)
Locals                  GROUP,PRE(LOC)
Ndx                         LONG
Length                      LONG
CurrentValString            CSTRING(10)
MaxWidth                    LONG
HexVal                      CSTRING(10)
Indent                      LONG
                        END
ST                      StringTheory
CurrentLineST           StringTheory


    CODE
        
        LOC:Indent = LEN(pLabel) + LEN(pDataType) + PAD_SIZE !Calculate the number of characters that we indent each line
        LOC:MaxWidth = CHOOSE(NOT pMaxWidth,80,pMaxWidth)    !Default the max width if not specified
        LOC:Length = LEN(pString)                            !Get the length of our data
        IF LOC:Length < 1                                    !Nothing to encode
            RETURN 0
        END
        LOOP LOC:Ndx = 1 TO LOC:Length                       !Process our string one character at a time
            ltoA(Val(pString[LOC:Ndx]),LOC:HexVal,16)        !Get the hex value 
            LOC:HexVal = ALL('0',3-LEN(LOC:HexVal)) & LOC:HexVal & 'H' !Pad the hex with zeros so everything lines up nice and perty   
            LOC:CurrentValString = CHOOSE(LOC:Ndx=1,'''<','') & LOC:HexVal & CHOOSE(LOC:Ndx = LOC:Length,'>''',',') !Either add commas or brackets, depending on position
            IF (CurrentLineST.Len() + LEN(LOC:CurrentValString) + PAD_SIZE + 2) >= LOC:MaxWidth !Check our width against the limits
                IF LOC:Ndx = LOC:Length                                                         !are we done done?
                   CurrentLineST.Append(LOC:HexVal & '>''')                                     !then don't add a continuation 
                ELSE                                                                            !otherwise,
                   CurrentLineST.Append(LOC:HexVal & '>'' &|')                                  !we will add continuation character for the next line
                END 
            ELSE 
                CurrentLineST.Append(LOC:CurrentValString)                                      !Appending in the middle of the line 
            END 
            IF CurrentLineST.Len() >= LOC:MaxWidth OR LOC:Ndx = LOC:Length                      !Re-check the width
                IF ST.Len()                                                                     !If we've already appended something
                    ST.Append('<13,10>' &  ALL(' ',LOC:Indent) & CurrentLineST.GetValue())      !Then append our line after the indent spaces 
                ELSE                                                                            !Otherwise  
                    IF pLabel                                                                   !We'll add the label if applicable
                      ST.SetValue(pLabel & '    ' & CLIP(pDataType) & '(' &  CurrentLineST.GetValue())
                    ELSE
                      ST.SetValue(ALL(' ',LOC:Indent) &  CurrentLineST.GetValue())              !Appending without the label
                    END
                END
                CurrentLineST.SetValue('''<')                                                   !Preparing for the next line
                IF LOC:Ndx = LOC:Length                                                         !If we're completely done
                    ST.Append(')')                                                              !then we can add the closing parenthesis
                END        
            END   
        END
        RETURN ST.GetValue()                                                                    !Return the result
    