package cobra.mvc.center.art.service;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


import cobra.mvc.center.common.domain.DTO;
import cobra.mvc.center.common.persistence.DAOImpl;
import cobra.mvc.center.common.service.HandlerUtil;
import cobra.mvc.center.art.domain.ShowDTO;
import cobra.mvc.center.art.domain.ShowMemberResDTO;
import cobra.mvc.center.art.domain.ShowResDTO;
import cobra.mvc.center.art.persistence.DAO_art_Impl;

@Service
public class ServiceImpl_art extends HandlerUtil implements Service_art{

	@Inject		DAOImpl dao;	
	@Inject		DAO_art_Impl dao_art;
	
	@Override	// ���� ��ȸ�ϱ�
	public int showFind(DTO dto, HttpServletRequest req) {
		// �α� =====================================================
		System.out.println("  �� showFind in  : " );		
		// �ʱ�ȭ ===================================================
		initHandlerUtil(req);
		
		for(String name : dto.getNames()){
			String value = (String)getVar(name);
			if(value!=null && value!="")
				dto.setValue(name, value);	
		}
		
		ArrayList<DTO> dtos = new ArrayList<DTO>();
		int cnt=0;
		
		// ���� =====================================================
		dtos = dao_art.showFind(dto);
		
		// ����� ===================================================
			//for(DTO d:dtos) d.getInfo();
		
		// ���� ��� ================================================
		
	
		// ��ȯ =====================================================
		
		if(dtos.size()!=0) {
			setVar("dtos", dtos);
			cnt = dtos.size();
			dto = cnt==1 ? dtos.get(0) : dto;
		}
		
		setVar("dto",dto);
		
		d("  �� showFind out :  / cnt : " + cnt);
		return cnt;
				
	}
	
	@Override	//��¥ ��ȸ�ϱ�
	public int showSeatView(DTO dto, HttpServletRequest req) {
		// �α� =====================================================
			System.out.println("  �� showSeatView in  : " );		
		
		// ������ȣ�� ��¥�� �����´�.
			// �ʱ�ȭ ===================================================
			initHandlerUtil(req);
			
			for(String name : dto.getNames()){
				Object value = getVar(name);
				if(value!=null && value!="")
					dto.set(name, value);	
			}
			
			ArrayList<DTO> dtos = new ArrayList<DTO>();			
			int cnt=0;

			// res_date �� show_num �� ������Ѵ�.
				d("res_date " + dto.get("res_date"));
				d("show_num " + dto.get("show_num"));
				d("res_date " + req.getParameter("res_date"));
				d("show_num " + req.getParameter("show_num"));
				
		// �ش� ��¥�� ���� ���°� �ִ��� ��ȸ
			cnt = dao.myCheck(dto).size();
						
		// ���ٸ� �¼� ������ ������ ����
			if(cnt==0){
				// ���� ��ȣ�� �¼����� ��ȸ
				DTO dtoT = new ShowDTO();			
				dtoT.setValue("show_num",dto.getValue("show_num"));
				dtos = dao.myCheck(dtoT);
				
				// �޾ƿ� �¼����� dto�� ��´�.  
				if(dtos!=null && dtos.size()==1)
					dto.setValue("seat",dtos.get(0).getValue("seat"));
				
				// �¼� ���� ������ �����Ѵ�. 
					// �������� Ű����++ �Ǿ�� �ϴµ�.. ��...				
				cnt = dao.myInsert(dto);
			}
			
		// �����´�.			
			dtos = dao.myCheck(dto);
			
		// �����Ѵ�.
			if(dtos.size()!=0) {
				setVar("dtos", dtos);
				cnt = dtos.size();
				dto = cnt==1 ? dtos.get(0) : dto;
			}			
			setVar("dto",dto);
			
			
			d("  �� showSeatView :  / cnt : " + cnt);
			return cnt;
	}
	
	@Override	// ���� ����ϱ�
	public int showResBack(DTO dto, HttpServletRequest req) {	//�̿ϼ�
		// �α� =====================================================
		System.out.println("  �� showResBack in  : " );		
			
	// ������ �޾ƿ´�. // �������� showResDTO
		// �ʱ�ȭ ===================================================
		initHandlerUtil(req);
		
		for(String name : dto.getNames()){
			Object value = getVar(name);
			if(value!=null && value!="")
				dto.set(name, value);	
		}
		
		ArrayList<DTO> dtos = new ArrayList<DTO>();			
		int cnt=0;
		
		// ������ ���� ��� // ���Ǵ� memberResDTO �� ���
			//id
			//show_num
			//res_date
			//seat
			//seat_code
				
		// ���� �¼� ��Ȳ�� �޾ƿ´�. 
			// ���� ��ȣ�� ��¥�� �ҷ��� ��´�.
			DTO resDto = new ShowResDTO();
			resDto.setValue("show_num", dto.getValue("show_num"));
			resDto.setValue("res_date", dto.getValue("res_date"));
			dtos = dao.myCheck(resDto);
			
			// ���� 1101 : ���� ���� ��Ȳ�� �ҷ��� �� ���ٸ� ����.   
			if(dtos==null || dtos.size()!=1)
				return 1101;
			
			String show_seat	= dtos.get(0).getValue("seat");	// ����� ��Ȳ
			String now_seat	= (String)getVar("seat");		// ������ 
		
		// ���� �¼� �� '2'�� '1'�� �ٲ㼭 ���ε��Ѵ�. 
			//now_seat �� '2' �� �ڸ��� ã�� show_seat ���� 1�� �ٲ۴�.
			
			int i=0;
			char[] show_seat_chars = show_seat.toCharArray();
			for(char s : now_seat.toCharArray()){
				if(s=='2')
					// ���� 1102 : ���� ��Ȳ ����ġ
					if(show_seat.toCharArray()[i]!='3')
						return 1102; 
					else
						show_seat_chars[i]='1';	
				i++;
			}
			
		// ���� �¼� ��Ȳ�� �ٲ۴�.			
			show_seat = String.valueOf(show_seat_chars);
			resDto.setValue("seat",show_seat);
			cnt = dao.myUpdate(resDto);
			
			// ���� 1103 : �¼� ������Ʈ ����
			if(cnt!=1)	return 1103;
			
		// ��� ������������ �����Ѵ�.			
			cnt = dao.myDelete(dto);	
			
			// ���� 1104 : ��� ���� ���� ����
			if(cnt!=1)	return 1104;
			
			d("cnt"+cnt);

		// �α� =====================================================
		System.out.println("  �� showResBack in  : " );
		
		// ���� =====================================================
		return cnt;
	}
	
	@Override	// �����ϱ�
	public int showResPro(DTO dto, HttpServletRequest req) {
		// �α� =====================================================
			System.out.println("  �� showResPro in  : " );		
				
		// ������ �޾ƿ´�. // �������� showResDTO
			// �ʱ�ȭ ===================================================
			initHandlerUtil(req);
			
			for(String name : dto.getNames()){
				Object value = getVar(name);
				if(value!=null && value!="")
					dto.set(name, value);	
			}
			
			ArrayList<DTO> dtos = new ArrayList<DTO>();			
			int cnt=0;
			
			// ������ ���� ��� // ���Ǵ� memberResDTO �� ���
				//id
				//show_num
				//res_date
				//seat
				//seat_code 
			
			
		// �¼� ��Ȳ�� ���Ѵ�.
			// ���� ��ȣ�� ��¥�� �ҷ��� ��´�.
			DTO resDto = dto.getNew();
			resDto.setValue("show_num", dto.getValue("show_num"));
			resDto.setValue("res_date", dto.getValue("res_date"));
			dtos = dao.myCheck(resDto);
			
			// ���� 1001 : ���� ���� ��Ȳ�� �ҷ��� �� ���ٸ� ����.   
			if(dtos==null || dtos.size()!=1)
				return 1001;
			
			String show_seat = dtos.get(0).getValue("seat");
			String now_seat = (String)getVar("seat");
			
			
			// ���� 1002 : �� �¼��� ���̰� �ٸ��ٸ� ����.
			if(show_seat.length()!=now_seat.length())
				return 1002;
			
			// ���� 1003 : �� �¼��� ���� ���°� �ٸ��ٸ� ����
			// 0�¼�X , 1�� , 2����, 3����
				// ������ ��û�� �ڷ�� ���Ѵ�. = ���°� 2�� ���� �ε����� ��� 1�̾���Ѵ�.
			int i=0;
			char[] show_seat_chars = show_seat.toCharArray();
			for(char s : now_seat.toCharArray()){
				if(s=='2')
					if(show_seat.toCharArray()[i]!='1')
						return 1003;
					else
						show_seat_chars[i]='3';
				i++;
			}
 			
		// ���� �¼� ������Ʈ
			show_seat = String.valueOf(show_seat_chars);
			
			//debug 
			d("show_seat : " + show_seat);
			d("now_seat : "  + now_seat);
			
		//����� �¼��� ���
		resDto.setValue("seat", show_seat);
			
		// ���� ��Ȳ ������Ʈ 
			// => ���� ��Ȳ ������Ʈ�� ������ �� �������� ������Ʈ �Ѵ�. 
		
		
		// ȸ���� ���� ����� �־��ش�.
			// ȸ�� ���� DTO�� �����͸� �ִ´�. 
			DTO memberDto = new ShowMemberResDTO();
						
			String[] names = {"id","show_num","res_date"};
				// ��ȸ�� �ʿ��� �͵鸸 �ִ´�.
			for(String name : names){
				Object value = getVar(name);
				if(value!=null && value!="")
					memberDto.set(name, value);
			}
						
			// ȸ���� ���� ����� ã�´�.
			cnt = dao.myCheck(memberDto).size();
			
			// ���� 1004 : ���� ����� �ߺ� ������ ��� ���� - �̹� ������ �ֽ��ϴ�. �ش� ���� ������ ����� �̿����ּ���.
				// ���� ��Ȳ ������Ʈ�� �׷��� �ڷ� ���� �Ѵ�. 
			if(cnt==1)
				return 1004;
			
			// ������Ʈ ���� �߰� �� ȸ�� ���� ����� �߰��Ѵ�.
				memberDto.set("seat", getVar("seat"));
				memberDto.set("seat_code", getVar("seat_code"));				
			cnt = dao.myInsert(memberDto);
			
			// ���� 1005 : ��� ���������� �߰����� ������ ����
			if(cnt==0)
				return 1005;
			
		// ���� ��Ȳ ������Ʈ 	
			cnt = dao.myUpdate(resDto);
			// ���� 1006 : ���� ��Ȳ ������Ʈ ���� �ʴ´ٸ� ����  
			if(cnt==0)
				return 1006;
			
		// ��Ȳ�� �����Ѵ�.
			
		return cnt;
	}
	
}	