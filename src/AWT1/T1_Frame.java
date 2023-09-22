package AWT1;

import java.awt.Frame;

public class T1_Frame {
	
	public static void main(String[] args) {
		Frame frame = new Frame();
		// 1. 생성자 Frame();
		// 1-1. Frame();
		// 초기 상태로 보여지지 않는 새로운 Frame 객체 생성 
		// 1-2. Frame(GraphicsConfiguration gc)
		// 지정된 GraphicsConFiguration을 사용해 초기 상태로 보여지지 않는 새로운 객체 생성 
		// 1-3. Frame (String Title)
		// 지정된 타이틀을 사용해, 초기 상태로 보여지지 않는 새로운 Frame 객체 생성
		// 1-4. Frame (String Title, GraphicsConfiguration gc)
		// 지정된 타이틀과 GraphicsConfiguration을 사용해, 초기 상태로 보여지지 않는 새로운 객체 생성
		// Frame 객체를 생성 했다는 것만으로는 창이 나타나지 않음.
		// Frame 클래스 속성 중에서 사용자에게 보여줄 것인지 아닌지에 대한 
		// 설정이 false로 되어있기 때문.
		// 따라서, 창을 보여주기 위한 메소드를 호출해 줘야 창을 볼 수 있음
		frame.setTitle("AWT 연습");	//	 화면 제목 설정
		frame.setSize(400, 300);  // (폭, 높이) : 픽셀단위
		
		frame.setVisible(true); // 창을 화면에 나타낼 것인지 설정
	}
	
}
