package awt2_Adaptor;

import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

@SuppressWarnings("serial")
public class T2_Button_Event extends Frame{

	Button btnPlay, btnExit;
	public T2_Button_Event() {
		super("어댑터 활용!!!");
	
		setBounds(300, 250, 300, 150);
	
		setBounds(300,250,300,150);
		this.setLayout(new FlowLayout());
		
		
		btnPlay = new Button("Play");
		btnExit	=	new Button("Exit");
		
		add(btnExit);
		add(btnPlay);
		
		
		setVisible(true);
	/* ------------------------------------------ */
	
		// btnPlay버튼 제어하기
		btnPlay.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				//System.out.println(e.getSource());;
				Button btn	=	(Button) e.getSource();
				
				if(btn.getLabel().equals("play")) {
					btn.setLabel("stop");
					System.out.println("음악이 시작되었습니다.");
				}
				else if(btn.getLabel().equals("stop")) {
					btn.setLabel("Play");
					System.out.println("음악이 종료되었습니다.");
				}
			}
		});
	// 종료 버튼(btnExit)을 이용한 윈도우 종료 
	
	btnExit.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			System.out.println("종료 버튼을 눌렀습니다.");
			System.exit(0);
		}
	});	
		
	// 윈도우 어뎁터를 이용한 윈도우 종료 	
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
	
	
	}	
	
	public static void main(String[] args) {
		new T2_Button_Event();
	}
}
