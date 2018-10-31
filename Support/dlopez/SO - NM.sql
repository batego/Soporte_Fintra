SELECT * FROM con.factura WHERE ref1 = 'FOMS12501-17';
SELECT documento, descripcion, valor_factura,valor_abono,valor_saldo,* FROM con.factura WHERE ref1 = 'FOMS12372-17';

SELECT 
f.documento,
(SELECT documento FROM con.factura WHERE documento ILIKE 'NM%' AND descripcion = f.descripcion) AS NM_asociada,
f.ref1
FROM con.factura f WHERE f.documento ILIKE 'S0%' AND  f.ref1 in('FOMS12501-17',
'FOMS12006-16',
'FOMS12324-17',
'FOMS12329-17',
'FOMS12328-17',
'FOMS12279-16',
'FOMS12296-16',
'FOMS12389-17',
'FOMS12481-17',
'FOMS12465-17',
'FOMS12261-16',
'FOMS12204-16',
'FOMS12337-17',
'FOMS12339-17',
'FALMS12459-17',
'FOMS12483-17',
'FOMS11927-16',
'FOMS12336-17',
'FOMS12340-17',
'FOMS12334-17',
'FOMS12333-17',
'FOMS12335-17',
'FOMS12347-17',
'FOMS12346-17',
'FOMS12281-16',
'FOMS12344-17',
'FOMS12282-16',
'FOMS12280-16',
'FOMS12240-16',
'FOMS12486-17',
'FOMS12485-17',
'FOMS12484-17',
'FOMS12356-17',
'FOMS12490-17',
'FOMS12491-17',
'FOMS12457-17',
'FOMS12488-17',
'FOMS12034-16',
'FOMS12375-17',
'FOMS12489-17',
'FOMS12487-17',
'FOMS12492-17',
'FOMS10852-15',
'FOMS11385-16',
'FOMS11336-16',
'FOMS05754-12',
'FOMS11949-16',
'FOMS11587-16',
'FOMS12030-16',
'FOMS12079-16',
'FOMS12166-16',
'FOMS11843-16',
'FOMS10686-15',
'FOMS12255-16',
'FOMS12219-16',
'FOMS12135-16',
'FOMS12267-16',
'FOMS12212-16',
'FOMS12210-16',
'FOMS12276-16',
'FOMS12289-16',
'FOMS12162-16',
'FOMS12290-16',
'FOMS12209-16',
'FOMS12063-16',
'FOMS12299-16',
'FOMS12297-16',
'FOMS12119-16',
'FOMS12245-16',
'FOMS12271-16',
'FOMS12287-16',
'FOMS12288-16',
'FALMS12295-16',
'FOMS12302-16',
'FOMS12303-16',
'FOMS12300-16',
'FOMS11991-16',
'FOMS12202-16',
'FOMS12306-16',
'FOMS12307-16',
'FOMS12361-17',
'FOMS12189-16',
'FOMS12360-17',
'FOMS12215-16',
'FOMS12284-16',
'FOMS12359-17',
'FOMS12363-17',
'FOMS12362-17',
'FOMS12367-17',
'FOMS12098-16',
'FOMS12371-17',
'FOMS12370-17',
'FOMS12368-17',
'FOMS12380-17',
'FOMS12372-17',
'FOMS12379-17',
'FOMS11988-16',
'FOMS12382-17',
'FOMS12369-17',
'FOMS12387-17',
'FOMS12381-17',
'FOMS12365-17',
'FOMS12377-17',
'FOMS12376-17',
'FOMS12378-17',
'FOMS12384-17',
'FOMS12386-17',
'FOMS12385-17',
'FOMS12057-16',
'FOMS12191-16',
'FALMS12364-17',
'FOMS11902-16',
'FOMS12383-17',
'FOMS11340-16',
'FOMS12298-16',
'FOMS12326-17',
'FOMS12397-17',
'FALMS12390-17',
'FOMS12396-17',
'FOMS12393-17',
'FOMS12391-17',
'FOMS12395-17',
'FOMS11538-16',
'FOMS12392-17',
'FOMS12394-17',
'FOMS12413-17',
'FOMS12218-16',
'FOMS12411-17',
'FOMS12417-17',
'FOMS12412-17',
'FOMS12136-16',
'FOMS12415-17',
'FOMS12418-17',
'FOMS12399-17',
'FOMS10379-15',
'FOMS12414-17',
'FOMS12416-17',
'FOMS12405-17',
'FOMS12429-17',
'FOMS12428-17',
'FOMS12207-16',
'FOMS12426-17',
'FOMS12348-17',
'FOMS12435-17',
'FOMS12434-17',
'FOMS12427-17',
'FOMS12430-17',
'FOMS12433-17',
'FOMS12260-16',
'FOMS12192-16',
'FOMS12374-17',
'FOMS12436-17',
'FOMS12443-17',
'FOMS12444-17',
'FOMS12448-17',
'FOMS12454-17',
'FOMS12453-17',
'FOMS12456-17',
'FOMS12452-17',
'FOMS12455-17',
'FOMS12449-17',
'FOMS12450-17',
'FOMS11986-16',
'FOMS12451-17',
'FOMS12400-17',
'FOMS12263-16',
'FOMS12469-17',
'FOMS12388-17',
'FOMS12325-17',
'FOMS12125-16',
'FOMS12254-16',
'FOMS12464-17',
'FOMS12475-17',
'FOMS12474-17',
'FOMS12463-17',
'FOMS12476-17',
'FOMS11750-16',
'FOMS12401-17',
'FOMS12438-17',
'FOMS12478-17',
'FOMS12208-16',
'FOMS12510-17',
'FOMS12470-17',
'FOMS12366-17',
'FOMS12509-17',
'FOMS12514-17',
'FOMS11254-16',
'FOMS12432-17',
'FOMS12517-17',
'FOMS12171-16',
'FOMS12515-17',
'FOMS12101-16',
'FOMS12262-16',
'FOMS12516-17',
'FOMS12425-17',
'FALMS12460-17',
'FOMS12327-17',
'FOMS11924-16',
'FOMS12524-17',
'FOMS12530-17',
'FOMS12527-17',
'FOMS12477-17',
'FOMS12507-17',
'FOMS12529-17',
'FOMS12528-17',
'FOMS12458-17',
'FOMS12164-16',
'FOMS12341-17',
'FOMS12539-17',
'FOMS12540-17',
'FOMS12423-17',
'FOMS12544-17',
'FOMS12437-17',
'FOMS12471-17',
'FOMS12545-17',
'FOMS12542-17',
'FOMS12543-17',
'FOMS12812-17',
'FOMS12815-17',
'FOMS12610-17',
'FOMS12480-17',
'FOMS12508-17',
'FOMS12531-17',
'FOMS12814-17',
'FOMS11707-16',
'FOMS13143-17',
'FOMS12806-17',
'FALMS13439-18',
'FOMS13480-18',
'FOMS13043-17',
'FOMS13074-17',
'FOMS12802-17',
'FOMS13290-17',
'FOMS13291-17',
'FOMS13485-18',
'FOMS13710-18',
'FOMS13682-18',
'FOMS12553-17',
'FOMS12535-17',
'FOMS12497-17',
'FOMS12556-17',
'FOMS12555-17',
'FOMS12440-17',
'FOMS13059-17',
'FOMS12559-17',
'FOMS12561-17',
'FOMS12342-17',
'FOMS12563-17',
'FOMS13061-17',
'FOMS13063-17',
'FOMS12938-17',
'FOMS13062-17',
'FOMS13060-17',
'FOMS12560-17',
'FOMS12554-17',
'FOMS12562-17',
'FOMS12330-17',
'FALMS12572-17',
'FOMS12410-17',
'FOMS12472-17',
'FOMS12920-17',
'FOMS13319-18',
'FOMS12865-17',
'FOMS12816-17',
'FOMS12791-17',
'FOMS12402-17',
'FOMS12445-17',
'FOMS13339-18',
'FOMS13320-18',
'FOMS13321-18',
'FOMS12525-17',
'FOMS12424-17',
'FOMS13316-18',
'FOMS13247-17',
'FOMS13111-17',
'FOMS13117-17',
'FOMS13483-18',
'FOMS13467-18',
'FOMS13454-18',
'FOMS13496-18',
'FOMS13443-18',
'FOMS13609-18',
'FOMS13645-18',
'FOMS13695-18',
'FOMS13642-18',
'FOMS13540-18',
'FOMS13500-18',
'FOMS13369-18',
'FOMS13306-18',
'FOMS13646-18',
'FOMS13027-17',
'FOMS13574-18',
'FOMS12577-17',
'FOMS12552-17',
'FOMS12578-17',
'FOMS12576-17',
'FOMS12446-17',
'FOMS12305-16',
'FOMS12575-17',
'FOMS12422-17',
'FOMS12511-17',
'FOMS12568-17',
'FOMS12283-16',
'FOMS12566-17',
'FOMS12473-17',
'FOMS13163-17',
'FOMS13569-18',
'FOMS13567-18',
'FOMS13550-18',
'FOMS13527-18',
'FOMS13568-18',
'FOMS13389-18',
'FOMS12821-17',
'FOMS13532-18',
'FOMS12914-17',
'FOMS13501-18',
'FOMS12809-17',
'FOMS12048-16',
'FOMS13660-18',
'FOMS12523-17',
'FOMS12587-17',
'FOMS12538-17',
'FOMS12588-17',
'FOMS12591-17',
'FOMS12462-17',
'FOMS12574-17',
'FOMS12585-17',
'FOMS12589-17',
'FOMS12590-17',
'FOMS12541-17',
'FOMS12586-17',
'FOMS12229-16',
'FOMS12447-17',
'FOMS12599-17',
'FOMS12600-17',
'FOMS12602-17',
'FOMS12601-17',
'FOMS12569-17',
'FOMS12604-17',
'FOMS12603-17',
'FOMS13459-18',
'FOMS13387-18',
'FOMS12658-17',
'FOMS13417-18',
'FOMS13506-18',
'FOMS12617-17',
'FOMS12618-17',
'FOMS12616-17',
'FOMS12323-17',
'FOMS12597-17',
'FOMS12619-17',
'FOMS12548-17',
'FOMS13003-17',
'FOMS13739-18',
'FOMS13702-18',
'FOMS13750-18',
'FOMS13046-17',
'FOMS13709-18',
'FOMS13694-18',
'FOMS12629-17',
'FOMS12639-17',
'FOMS12626-17',
'FOMS12632-17',
'FOMS12635-17',
'FOMS12649-17',
'FOMS12634-17',
'FOMS12633-17',
'FOMS12596-17',
'FOMS12638-17',
'FOMS12627-17',
'FOMS12637-17',
'FOMS12631-17',
'FOMS12630-17',
'FOMS12628-17',
'FOMS12636-17',
'FOMS13440-18',
'FOMS13553-18',
'FOMS12969-17',
'FOMS13564-18',
'FOMS13509-18',
'FOMS13348-18',
'FOMS13583-18',
'FOMS13589-18',
'FALMS13591-18',
'FOMS12648-17',
'FOMS12651-17',
'FOMS12652-17',
'FOMS12521-17',
'FOMS12650-17',
'FOMS12551-17',
'FOMS12537-17',
'FOMS12647-17',
'FOMS12645-17',
'FOMS13616-18',
'FOMS13613-18',
'FOMS13580-18',
'FOMS13531-18',
'FOMS13622-18',
'FOMS13595-18',
'FOMS13541-18',
'FOMS13655-18',
'FOMS13654-18',
'FOMS13651-18',
'FOMS13610-18',
'FOMS13628-18',
'FOMS13604-18',
'FOMS12663-17',
'FOMS12660-17',
'FOMS12654-17',
'FOMS12662-17',
'FOMS12468-17',
'FOMS12502-17',
'FOMS12667-17',
'FOMS12661-17',
'FOMS12664-17',
'FOMS12666-17',
'FOMS12621-17',
'FOMS12668-17',
'FOMS12665-17',
'FOMS13484-18',
'FOMS13573-18',
'FOMS13428-18',
'FOMS12624-17',
'FOMS12050-16',
'FOMS12549-17',
'FOMS12482-17',
'FOMS13240-17',
'FOMS13546-18',
'FOMS13298-18',
'FOMS12506-17',
'FOMS13433-18',
'FOMS13603-18',
'FOMS12593-17',
'FOMS12503-17',
'FOMS12498-17',
'FOMS12518-17',
'FOMS12499-17',
'FOMS12583-17',
'FOMS12354-17',
'FOMS12049-16',
'FOMS12355-17',
'FOMS12349-17',
'FOMS12582-17',
'FOMS12675-17',
'FOMS12264-16',
'FOMS12265-16',
'FOMS12681-17',
'FOMS12685-17',
'FOMS12686-17',
'FOMS12684-17',
'FOMS12669-17',
'FOMS12687-17',
'FOMS13486-18',
'FOMS12343-17',
'FOMS12353-17',
'FOMS12699-17',
'FOMS12694-17',
'FOMS12698-17',
'FOMS12695-17',
'FOMS12700-17',
'FOMS12672-17',
'FOMS12674-17',
'FOMS12696-17',
'FOMS12608-17',
'FOMS12709-17',
'FOMS12707-17',
'FOMS12713-17',
'FOMS12708-17',
'FOMS12710-17',
'FOMS12512-17',
'FOMS12711-17',
'FOMS12712-17',
'FOMS13497-18',
'FALMS13522-18',
'FOMS13600-18',
'FOMS13086-17',
'FOMS13491-18',
'FOMS13594-18',
'FOMS13492-18',
'FOMS12722-17',
'FOMS12718-17',
'FOMS12720-17',
'FOMS12671-17',
'FOMS12705-17',
'FOMS12520-17',
'FOMS12704-17',
'FOMS12721-17',
'FOMS12717-17',
'FOMS12692-17',
'FOMS12706-17',
'FOMS12408-17',
'FOMS12719-17',
'FOMS13057-17',
'FOMS13593-18',
'FOMS13570-18',
'FOMS13535-18',
'FOMS13579-18',
'FOMS13586-18',
'FOMS13383-18',
'FOMS13563-18',
'FOMS13581-18',
'FOMS12729-17',
'FOMS12727-17',
'FOMS12673-17',
'FOMS12691-17',
'FOMS12728-17',
'FOMS12594-17',
'FOMS13588-18',
'FOMS13544-18',
'FOMS13598-18',
'FOMS13559-18',
'FOMS13582-18',
'FOMS13520-18',
'FOMS13475-18',
'FOMS12734-17',
'FOMS12735-17',
'FOMS12732-17',
'FOMS12406-17',
'FOMS12733-17',
'FOMS12557-17',
'FOMS12723-17',
'FOMS12403-17',
'FOMS12404-17',
'FOMS13518-18',
'FOMS13587-18',
'FOMS13555-18',
'FOMS13421-18',
'FOMS13356-18',
'FOMS13426-18',
'FOMS12653-17',
'FOMS12614-17',
'FOMS12570-17',
'FOMS12744-17',
'FOMS12613-17',
'FOMS13412-18',
'FOMS13511-18',
'FOMS13340-18',
'FOMS13508-18',
'FOMS13525-18',
'FOMS13515-18',
'FOMS13536-18',
'FOMS13502-18',
'FOMS13487-18',
'FOMS13599-18',
'FOMS13630-18',
'FOMS12352-17',
'FOMS12579-17',
'FOMS12746-17',
'FOMS12461-17',
'FOMS13619-18',
'FOMS13678-18',
'FOMS13512-18',
'FOMS13634-18',
'FOMS13513-18',
'FOMS13521-18',
'FOMS13519-18',
'FOMS13528-18',
'FOMS13608-18',
'FALMS13669-18',
'FOMS13578-18',
'FOMS13523-18',
'FOMS13507-18',
'FOMS13562-18',
'FOMS13679-18',
'FOMS13597-18',
'FOMS13680-18',
'FOMS13615-18',
'FOMS13618-18',
'FOMS13510-18',
'FOMS12751-17',
'FOMS12690-17',
'FOMS12748-17',
'FOMS12749-17',
'FOMS12725-17',
'FOMS12373-17',
'FOMS12479-17',
'FOMS12750-17',
'FOMS12407-17',
'FOMS13427-18',
'FOMS12266-16',
'FOMS12231-16',
'FOMS12533-17',
'FOMS12747-17',
'FOMS12736-17',
'FOMS13504-18',
'FOMS12682-17',
'FOMS12607-17',
'FOMS12294-16',
'FOMS13466-18',
'FOMS12496-17',
'FOMS13547-18',
'FOMS13385-18',
'FOMS13503-18',
'FOMS12758-17',
'FOMS12763-17',
'FOMS12757-17',
'FOMS12759-17',
'FOMS12756-17',
'FOMS12760-17',
'FOMS12762-17',
'FOMS12761-17',
'FOMS12689-17',
'FOMS12714-17',
'FOMS12703-17',
'FOMS13548-18',
'FOMS13505-18',
'FOMS13499-18',
'FOMS12779-17',
'FOMS12776-17',
'FOMS12773-17',
'FOMS12774-17',
'FOMS12778-17',
'FOMS12622-17',
'FOMS12777-17',
'FOMS12752-17',
'FOMS12775-17',
'FOMS12676-17',
'FOMS12322-16',
'FOMS12772-17',
'FOMS12495-17',
'FOMS12657-17',
'FOMS12782-17',
'FOMS12781-17',
'FOMS12783-17',
'FOMS12785-17',
'FOMS12780-17',
'FOMS12784-17',
'FOMS12739-17',
'FOMS13551-18',
'FOMS13549-18',
'FOMS13144-17',
'FOMS12519-17',
'FOMS12798-17',
'FOMS13079-17',
'FOMS13524-18',
'FOMS12793-17',
'FOMS12795-17',
'FOMS12740-17',
'FOMS12796-17',
'FOMS12794-17',
'FALMS12755-17',
'FOMS12811-17',
'FOMS12813-17',
'FOMS13460-18',
'FOMS13419-18',
'FOMS12829-17',
'FOMS13493-18',
'FOMS13639-18',
'FOMS13624-18',
'FOMS13625-18',
'FOMS13474-18',
'FOMS13557-18',
'FOMS13623-18',
'FOMS12767-17',
'FOMS12615-17',
'FOMS12769-17',
'FOMS12828-17',
'FOMS12493-17',
'FOMS12830-17',
'FOMS12822-17',
'FOMS12826-17',
'FOMS12546-17',
'FOMS12825-17',
'FOMS12827-17',
'FOMS12797-17',
'FOMS12693-17',
'FOMS13393-18',
'FOMS12605-17',
'FOMS12839-17',
'FOMS12836-17',
'FOMS12838-17',
'FOMS12494-17',
'FOMS12743-17',
'FOMS12742-17',
'FOMS12837-17',
'FOMS12856-17',
'FOMS12851-17',
'FOMS12788-17',
'FOMS12857-17',
'FOMS12852-17',
'FOMS12854-17',
'FOMS12655-17',
'FOMS12831-17',
'FOMS12858-17',
'FOMS12853-17',
'FOMS12855-17',
'FOMS12741-17',
'FOMS12683-17',
'FOMS12697-17',
'FOMS12835-17',
'FOMS12716-17',
'FOMS12879-17',
'FOMS12874-17',
'FOMS12880-17',
'FOMS12859-17',
'FOMS12881-17',
'FOMS12584-17',
'FOMS12875-17',
'FOMS12846-17',
'FOMS12872-17',
'FOMS12877-17',
'FOMS12862-17',
'FOMS12876-17',
'FOMS12790-17',
'FOMS12882-17',
'FALMS12873-17',
'FOMS12878-17',
'FOMS12887-17',
'FOMS12843-17',
'FOMS12844-17',
'FOMS12357-17',
'FOMS12731-17',
'FOMS12906-17',
'FOMS12768-17',
'FOMS12819-17',
'FOMS12904-17',
'FOMS12908-17',
'FOMS12907-17',
'FOMS12849-17',
'FOMS12861-17',
'FOMS12900-17',
'FOMS12909-17',
'FOMS12901-17',
'FOMS12903-17',
'FOMS12899-17',
'FOMS12905-17',
'FOMS12902-17',
'FOMS12911-17',
'FOMS12893-17',
'FOMS12892-17',
'FOMS11734-16',
'FOMS12670-17',
'FOMS12910-17',
'FOMS12870-17',
'FOMS12912-17',
'FOMS12894-17',
'FOMS12804-17',
'FOMS12890-17',
'FOMS12891-17',
'FOMS12930-17',
'FOMS12770-17',
'FOMS12842-17',
'FOMS12927-17',
'FOMS12926-17',
'FOMS12935-17',
'FOMS12928-17',
'FOMS12931-17',
'FOMS12929-17',
'FOMS12787-17',
'FOMS12925-17',
'FOMS12932-17',
'FOMS12933-17',
'FOMS12934-17',
'FOMS12944-17',
'FOMS12946-17',
'FOMS12886-17',
'FOMS12715-17',
'FOMS12948-17',
'FOMS12945-17',
'FOMS12947-17',
'FOMS12949-17',
'FOMS12656-17',
'FOMS12953-17',
'FOMS12913-17',
'FOMS12884-17',
'FOMS12954-17',
'FOMS12956-17',
'FOMS12957-17',
'FOMS12955-17',
'FOMS12958-17',
'FOMS12942-17',
'FOMS12940-17',
'FOMS12941-17',
'FOMS12895-17',
'FOMS12099-16',
'FOMS12965-17',
'FOMS12973-17',
'FOMS12864-17',
'FOMS12850-17',
'FOMS12963-17',
'FOMS12764-17',
'FOMS12974-17',
'FOMS12950-17',
'FOMS12971-17',
'FOMS12975-17',
'FOMS12611-17',
'FOMS12970-17',
'FOMS12972-17',
'FOMS12898-17',
'FOMS12977-17',
'FOMS12979-17',
'FOMS12917-17',
'FOMS12967-17',
'FOMS12980-17',
'FOMS12978-17',
'FOMS12888-17',
'FOMS12595-17',
'FOMS12840-17',
'FOMS12817-17',
'FOMS12832-17',
'FOMS12860-17',
'FOMS12988-17',
'FOMS13000-17',
'FOMS12999-17',
'FOMS12919-17',
'FOMS12998-17',
'FOMS12592-17',
'FOMS12994-17',
'FOMS12993-17',
'FOMS12984-17',
'FOMS12991-17',
'FOMS12995-17',
'FALMS12981-17',
'FOMS12982-17',
'FOMS12997-17',
'FOMS12992-17',
'FOMS12996-17',
'FOMS12724-17',
'FOMS12896-17',
'FOMS12820-17',
'FOMS13012-17',
'FOMS13010-17',
'FOMS12968-17',
'FOMS13007-17',
'FOMS12833-17',
'FOMS13008-17',
'FOMS13011-17',
'FOMS13009-17',
'FOMS12889-17',
'FOMS12951-17',
'FOMS13031-17',
'FOMS12985-17',
'FOMS12966-17',
'FOMS12754-17',
'FOMS12924-17',
'FOMS13032-17',
'FOMS13013-17',
'FOMS13014-17',
'FOMS13015-17',
'FOMS12918-17',
'FOMS13051-17',
'FOMS13050-17',
'FOMS12680-17',
'FOMS13054-17',
'FOMS13048-17',
'FOMS13055-17',
'FOMS13053-17',
'FOMS11000-15',
'FOMS13049-17',
'FOMS13052-17',
'FOMS12149-16',
'FOMS12792-17',
'FOMS13071-17',
'FOMS13072-17',
'FOMS12986-17',
'FOMS12678-17',
'FOMS13066-17',
'FOMS13073-17',
'FOMS13068-17',
'FOMS13069-17',
'FOMS13067-17',
'FOMS12915-17',
'FOMS12730-17',
'FOMS13070-17',
'FOMS12466-17',
'FOMS12923-17',
'FOMS13042-17',
'FOMS12547-17',
'FOMS12866-17',
'FOMS12643-17',
'FOMS12800-17',
'FOMS13090-17',
'FOMS13089-17',
'FOMS12867-17',
'FOMS13091-17',
'FOMS13088-17',
'FOMS12442-17',
'FOMS13087-17',
'FOMS12534-17',
'FOMS12771-17',
'FOMS13056-17',
'FOMS13024-17',
'FOMS13094-17',
'FOMS13033-17',
'FOMS12183-16',
'FOMS12623-17',
'FOMS13058-17',
'FOMS13100-17',
'FOMS13040-17',
'FOMS13102-17',
'FOMS12976-17',
'FOMS13101-17',
'FOMS12598-17',
'FOMS12609-17',
'FOMS13107-17',
'FOMS13104-17',
'FOMS13105-17',
'FOMS12964-17',
'FOMS13103-17',
'FOMS13106-17',
'FOMS13125-17',
'FOMS13121-17',
'FOMS12801-17',
'FOMS13001-17',
'FOMS13127-17',
'FOMS13128-17',
'FOMS12939-17',
'FOMS13122-17',
'FOMS13078-17',
'FOMS13037-17',
'FOMS12834-17',
'FOMS13124-17',
'FOMS13130-17',
'FOMS12961-17',
'FOMS13123-17',
'FOMS12799-17',
'FOMS13129-17',
'FOMS12962-17',
'FOMS13038-17',
'FOMS13146-17',
'FOMS13150-17',
'FOMS13145-17',
'FOMS12789-17',
'FOMS13109-17',
'FOMS13147-17',
'FOMS13148-17',
'FOMS13149-17',
'FOMS13077-17',
'FOMS13110-17',
'FOMS12753-17',
'FOMS13126-17',
'FOMS13099-17',
'FOMS13151-17',
'FOMS13133-17',
'FOMS13152-17',
'FOMS13082-17',
'FOMS13065-17',
'FOMS13083-17',
'FOMS13084-17',
'FOMS12421-17',
'FOMS13026-17',
'FOMS13092-17',
'FOMS12936-17',
'FOMS13170-17',
'FOMS13172-17',
'FOMS13169-17',
'FOMS12952-17',
'FOMS10672-15',
'FOMS13168-17',
'FOMS13171-17',
'FOMS13183-17',
'FOMS13180-17',
'FOMS13177-17',
'FOMS13178-17',
'FOMS13164-17',
'FOMS13179-17',
'FOMS13184-17',
'FOMS13182-17',
'FOMS13034-17',
'FOMS13174-17',
'FOMS13181-17',
'FOMS12441-17',
'FOMS12786-17',
'FOMS12805-17',
'FOMS13190-17',
'FOMS13191-17',
'FOMS12845-17',
'FOMS13192-17',
'FOMS13005-17',
'FOMS13004-17',
'FOMS13095-17',
'FOMS13186-17',
'FOMS13108-17',
'FOMS13206-17',
'FOMS13156-17',
'FOMS13157-17',
'FOMS13187-17',
'FOMS13134-17',
'FOMS13200-17',
'FOMS13113-17',
'FOMS13199-17',
'FOMS13202-17',
'FOMS13205-17',
'FOMS13204-17',
'FOMS13036-17',
'FOMS13211-17',
'FOMS13212-17',
'FOMS13213-17',
'FOMS12803-17',
'FOMS12916-17',
'FOMS12644-17',
'FOMS13167-17',
'FOMS13229-17',
'FOMS13233-17',
'FOMS13231-17',
'FOMS13228-17',
'FOMS13230-17',
'FOMS13235-17',
'FOMS13131-17',
'FOMS13236-17',
'FOMS13232-17',
'FOMS13142-17',
'FOMS13075-17',
'FOMS13227-17',
'FOMS13165-17',
'FOMS13085-17',
'FOMS13076-17',
'FOMS13249-17',
'FOMS13039-17',
'FOMS13248-17',
'FOMS13244-17',
'FOMS13243-17',
'FOMS13173-17',
'FOMS13225-17',
'FOMS13242-17',
'FOMS13269-17',
'FOMS13271-17',
'FOMS13272-17',
'FOMS12818-17',
'FOMS13161-17',
'FOMS13138-17',
'FOMS13234-17',
'FOMS13114-17',
'FOMS13270-17',
'FOMS13280-17',
'FOMS13263-17',
'FOMS13273-17',
'FOMS13267-17',
'FOMS13119-17',
'FOMS13262-17',
'FOMS13245-17',
'FOMS13223-17',
'FOMS13158-17',
'FOMS13281-17',
'FOMS13209-17',
'FOMS13016-17',
'FOMS13282-17',
'FOMS13266-17',
'FOMS13096-17',
'FOMS13222-17',
'FOMS13264-17',
'FOMS13268-17',
'FOMS13261-17',
'FOMS12922-17',
'FOMS13019-17',
'FOMS13029-17',
'FOMS13021-17',
'FOMS13025-17',
'FOMS13002-17',
'FOMS12983-17',
'FOMS13160-17',
'FOMS13020-17',
'FOMS13194-17',
'FOMS13265-17',
'FOMS13162-17',
'FOMS13287-17',
'FOMS13224-17',
'FOMS13288-17',
'FOMS13260-17',
'FOMS13217-17',
'FOMS13285-17',
'FOMS13289-17',
'FOMS13286-17',
'FOMS13226-17',
'FOMS13189-17',
'FOMS12885-17',
'FOMS12246-16',
'FOMS13284-17',
'FOMS13277-17',
'FOMS13196-17',
'FOMS13258-17',
'FALMS13304-18',
'FOMS13278-17',
'FOMS13274-17',
'FOMS13309-18',
'FOMS13310-18',
'FOMS13311-18',
'FOMS13197-17',
'FOMS13220-17',
'FOMS13315-18',
'FOMS13250-17',
'FOMS13193-17',
'FOMS13239-17',
'FOMS13279-17',
'FOMS13317-18',
'FOMS13296-18',
'FOMS13283-17',
'FOMS13292-17',
'FOMS13253-17',
'FOMS13299-18',
'FOMS13333-18',
'FOMS13314-18',
'FOMS13318-18',
'FOMS13329-18',
'FOMS13332-18',
'FOMS13322-18',
'FOMS13305-18',
'FOMS13300-18',
'FOMS13324-18',
'FOMS13195-17',
'FOMS13136-17',
'FOMS13166-17',
'FOMS13326-18',
'FOMS13028-17',
'FOMS13294-17',
'FOMS13221-17',
'FOMS13307-18',
'FOMS13323-18',
'FOMS13365-18',
'FOMS13345-18',
'FOMS13347-18',
'FOMS13098-17',
'FOMS13255-17',
'FOMS13379-18',
'FOMS13342-18',
'FOMS13378-18',
'FOMS13331-18',
'FOMS13334-18',
'FOMS13346-18',
'FOMS13254-17',
'FOMS13344-18',
'FOMS13327-18',
'FOMS13325-18',
'FOMS13018-17',
'FOMS13350-18',
'FOMS13301-18',
'FOMS13392-18',
'FOMS13373-18',
'FOMS13370-18',
'FOMS13368-18',
'FOMS13137-17',
'FOMS13335-18',
'FOMS13343-18',
'FOMS13391-18',
'FOMS13341-18',
'FOMS13118-17',
'FOMS13375-18',
'FOMS13141-17',
'FOMS13376-18',
'FOMS13388-18',
'FOMS13377-18',
'FOMS13405-18',
'FOMS13361-18',
'FOMS13406-18',
'FOMS12522-17',
'FOMS13362-18',
'FOMS13363-18',
'FOMS13360-18',
'FOMS13404-18',
'FOMS13044-17',
'FOMS13408-18',
'FOMS13336-18',
'FOMS13407-18',
'FOMS13139-17',
'FOMS13409-18',
'FOMS13045-17',
'FOMS13357-18',
'FOMS13257-17',
'FOMS12606-17',
'FOMS13210-17',
'FOMS13401-18',
'FOMS13047-17',
'FOMS13276-17',
'FOMS13382-18',
'FOMS13395-18',
'FOMS13295-17',
'FOMS13041-17',
'FOMS13352-18',
'FOMS13414-18',
'FOMS13017-17',
'FOMS13394-18',
'FOMS13355-18',
'FOMS12766-17',
'FOMS13400-18',
'FOMS13411-18',
'FOMS13381-18',
'FOMS13384-18',
'FOMS13399-18',
'FOMS13353-18',
'FOMS13093-17',
'FOMS13354-18',
'FOMS13390-18',
'FOMS13445-18',
'FOMS13429-18',
'FOMS13446-18',
'FOMS13413-18',
'FOMS13436-18',
'FOMS13430-18',
'FOMS13416-18',
'FOMS13218-17',
'FOMS13447-18',
'FOMS13415-18',
'FOMS13431-18',
'FOMS13364-18',
'FOMS13465-18',
'FOMS13469-18',
'FOMS13473-18',
'FOMS13380-18',
'FOMS13140-17',
'FOMS13424-18',
'FOMS13374-18',
'FOMS13451-18',
'FOMS13328-18',
'FOMS13303-18',
'FOMS13358-18',
'FOMS13434-18',
'FOMS13455-18',
'FOMS13470-18',
'FOMS13471-18',
'FOMS13302-18',
'FOMS13462-18',
'FOMS12350-17',
'FOMS13337-18',
'FOMS13461-18',
'FOMS12990-17',
'FOMS13463-18',
'FOMS13132-17',
'FOMS13464-18',
'FOMS13397-18',
'FOMS13477-18',
'FOMS13482-18',
'FOMS13452-18',
'FOMS13441-18',
'FOMS13219-17',
'FOMS13468-18',
'FOMS13442-18',
'FOMS13458-18',
'FOMS13476-18',
'FOMS13457-18',
'FOMS13246-17',
'FOMS13403-18',
'FOMS13188-17',
'FOMS13481-18',
'FOMS13423-18',
'FOMS13450-18',
'FOMS13456-18',
'FOMS13022-17',
'FOMS13349-18',
'FOMS13422-18',
'FOMS12807-17',
'FOMS12808-17',
'FOMS13367-18',
'FOMS13472-18',
'FOMS13644-18',
'FOMS13687-18',
'FOMS13711-18',
'FOMS13707-18',
'FOMS13631-18',
'FOMS13135-17',
'FOMS13720-18',
'FOMS13621-18',
'FOMS13154-17',
'FOMS13700-18',
'FOMS13153-17',
'FOMS13688-18',
'FOMS13672-18',
'FOMS13629-18',
'FOMS13670-18',
'FOMS13558-18',
'FOMS13607-18',
'FOMS13617-18',
'FOMS13733-18',
'FOMS13693-18',
'FOMS13732-18',
'FOMS13756-18',
'FOMS13714-18',
'FOMS13757-18',
'FOMS13705-18',
'FOMS13684-18',
'FOMS13713-18',
'FOMS13715-18',
'FOMS13712-18',
'FOMS13766-18',
'FOMS13743-18',
'FOMS13703-18',
'FOMS13704-18',
'FOMS13698-18',
'FOMS13767-18',
'FOMS13572-18',
'FOMS13656-18',
'FOMS13785-18',
'FOMS13744-18',
'FOMS13661-18',
'FOMS13699-18',
'FOMS13207-17',
'FOMS13734-18',
'FOMS13737-18',
'FOMS13738-18',
'FOMS13692-18',
'FOMS13576-18',
'FOMS13708-18',
'FOMS13779-18',
'FOMS13035-17',
'FOMS13765-18',
'FOMS13781-18',
'FOMS13780-18',
'FOMS13811-18',
'FOMS13478-18',
'FOMS13690-18',
'FOMS13815-18',
'FOMS13742-18',
'FOMS13768-18',
'FOMS13727-18',
'FOMS13787-18',
'FOMS13813-18',
'FOMS13725-18',
'FOMS13777-18',
'FOMS13718-18',
'FOMS13662-18',
'FOMS13516-18',
'FOMS13755-18',
'FOMS13632-18',
'FOMS13721-18',
'FOMS13498-18',
'FOMS12847-17',
'FOMS13626-18',
'FOMS13722-18',
'FOMS13862-18',
'FOMS13822-18',
'FOMS13824-18',
'FOMS13023-17',
'FOMS13606-18',
'FOMS13771-18',
'FOMS13529-18',
'FOMS13764-18')
;
