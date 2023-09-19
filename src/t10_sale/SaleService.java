package t10_sale;

import java.util.Scanner;

public class SaleService {
	Scanner scanner = new Scanner(System.in);
	
	ProductDAO	dao	=	null;
	ProductVO pVo = null;
	SaleVO sVo = null;
	
	String pName	=	"";
	
	//판매내역등록
	while(true) {
		System.out.print("판매상품명을 입력하세요? ");
		pName = scanner.next();
		
		
		// 판매 상품 검색 
		private void saleSearch() {
			
		}
		
		
		// 상품명 중복처리
		pvo = dao.getNameSearch(pName);
		if(pvo.getpName() != null) System.out.println("==> 동일한 상품이 존재합니다.");
		else {
			svo.setpName(pName);
			System.out.print("판매수량를 입력하세요? ");
			svo.setEa(scanner.nextInt());
			res = SaleVO.setSaleInput(sVo);
			if(res == 0) System.out.println("==>판매 상품 등록 실패~~");
			System.out.println("==>판매 상품이 등록되었습니다.");
			
			System.out.print("상품을 계속 등록하시겠습니까?(y/n) ");
			ans = scanner.next().toUpperCase();
			if(ans.equals("N")) break;
		}
	}


	
	public SaleService(ProductDAO dao) {
		this.dao	=	dao;
	}
}
