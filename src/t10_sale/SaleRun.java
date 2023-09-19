package t10_sale;

import java.util.Scanner;

public class SaleRun {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		ProductDAO dao = new ProductDAO();
		boolean run = true;
		
		while(run) {
			System.out.println("\n\t*** 작업선택 ***");
			System.out.println("========================================");
			System.out.println("1:상품관리   2:판매관리   3:종료");
			int no = scanner.nextInt();
			
			switch(no) {
				case 1:
					ProductService pService = new ProductService(dao);
					pService.getProductMenu();
					break;
				case 2:
					ProductService pService = new ProductService(dao);
					sService.getSaleMenu();
					break;
				default:
					run = false;
			}
			dao.connClose();
		}
		System.out.println("========================================");
		System.out.println("\t작업끝...");
		
		scanner.close();
	}
}
