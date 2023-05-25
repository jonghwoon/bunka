package cobra.mvc.center.sports.service;

import org.springframework.ui.Model;

public interface SportsService {
	
	
	public void loginchk(Model model) throws Exception;
	
	
	public void userinfo(Model model) throws Exception;
	
	//�ü����� Ȯ��
	public void clubchk(Model model) throws Exception;
	
	//ü���ü� ����
	public void clubadd(Model model) throws Exception;
	
	//���� ���
	public void fieldinsert(Model model) throws Exception;
	
	//���� ���
	public void place(Model model) throws Exception;
	
	//���� ���
	public void newteam(Model model) throws Exception;
	
	//�� ���
	public void teamlist(Model model) throws Exception;
	
	//�� ����
	public void teamdelete(Model model) throws Exception;
	
	//�� ����
	public void teamselect(Model model) throws Exception;
	
	//���� ����
	public void fieldselect(Model model) throws Exception;
	
	//��Ī ��� matching
	public void matchinglist(Model model) throws Exception;
	
	//��Ī ���
	public void matchinginsert(Model model) throws Exception;
	
	//��Ī ��� 
	public void matchingcancle(Model model) throws Exception;
	
	//��� 
	public void yellowcard(Model model) throws Exception;
	
	//���� ���� 
	public void playerinfo(Model model) throws Exception;
	
	//���� ���� 
	public void playerselect(Model model) throws Exception;
	
	//���� ��� 
	public void playeradd(Model model) throws Exception;
	
	//���� Ż��
	public void playerdelete(Model model) throws Exception;
	
	//���� ��� 
	public void reservationPro(Model model) throws Exception;
	
	//���� ��Ȳ
	public void calendarchk(Model model) throws Exception;
	
	//������Ʈ ��� 
	public void blacklist(Model model) throws Exception;
	
	//Ŭ���� ���� 
	public void clubinfo(Model model) throws Exception;
	
	//���� Ȯ��
	public void reservationchk(Model model) throws Exception;
	
	//���� ��� 
	public void rescancle(Model model) throws Exception;
	
	//�� ���� 
	public void teamadmin(Model model) throws Exception;
	
	//�� ���Խ�û
	public void teamask(Model model) throws Exception;
	
	//������� �� 
	public void playeraddform(Model model) throws Exception;
	
	//���̵�� �� �˻�
	public void teamsearch(Model model) throws Exception;
	
	//���� üũ
	public void adminchk(Model model) throws Exception;
	
	//��й�ȣ üũ
	public void passwdchk(Model model) throws Exception;
	
	//��Ī 
	public void matchingask(Model model) throws Exception;
	
	//��Ī ����
	public void matchingcom (Model model) throws Exception;

	//������Ʈ ����
	public void blacklistdel(Model model) throws Exception;

	//������Ʈ �߰�
	public void blacklistadd(Model model) throws Exception;
	
	//���Խ��� 
	public void askok(Model model) throws Exception;
	
	//������Ʈ ���� 
	public void blacklistadmin(Model model) throws Exception;
	
	//������Ʈ ��� 
	public void blacklistupdate(Model model) throws Exception;
	
	//�׷��� 
	public void graph(Model model) throws Exception;
}
