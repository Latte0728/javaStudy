package t3_hoiwon;

public class HoiwonRun {
	public static void main(String[] args) {
	//HoiwonDAO dao = new HoiwonDAO();
	//HoiwonDAO2 dao = new HoiwonDAO2();
		HoiwonDAO dao = new HoiwonDAO();
	// hoiwon테이블의 전체 회원 조회....
		dao.getList();
		
		// DB conn객체 close
		dao.connClose();
	}
}
