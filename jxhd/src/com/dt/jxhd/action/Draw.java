package com.dt.jxhd.action;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
public class Draw extends WindowAdapter implements ActionListener,WindowListener
{Canvas c;TextField radius,x,y;Button b;
 public static void main(String args[])
 {Draw d=new Draw();
  Frame f=new Frame("ª≠≤ºª≠‘≤");
  d.c=new Canvas();
  d.x=new TextField(5);
  d.y=new TextField(5);
  d.radius=new TextField(5);
  d.b=new Button("«Âø’ª≠≤º");
  Label x1=new Label("«Î ‰»Î◊Û…œΩ«x£∫");
  Label y1=new Label("«Î ‰»Î◊Û…œΩ«y£∫");
  Label radius1=new Label("«Î ‰»Î∞Îæ∂£∫");
  Panel p=new Panel();
  f.setLayout(new BorderLayout());
  p.setLayout(new FlowLayout());
  f.add("Center",d.c);
  f.add("South",p);
  p.add(radius1);p.add(d.radius);p.add(x1);p.add(d.x);
  p.add(y1);p.add(d.y);p.add(d.b);
  d.x.addActionListener(d);
  d.y.addActionListener(d);
  d.radius.addActionListener(d);
  d.b.addActionListener(d);
  f.addWindowListener(d);
  f.setSize(600,400);
  f.setVisible(true);
 }
 public void actionPerformed(ActionEvent e)
 {if(e.getSource()==b)
  {c.repaint();
   x.setText("");y.setText("");radius.setText("");
   radius.requestFocusInWindow();
  }
  else
  {if(!(radius.getText()==""||x.getText()==""||y.getText()==""))
   {c.getGraphics().drawOval(Integer.parseInt(x.getText()),Integer.parseInt(y.getText()),2*Integer.parseInt(radius.getText()),2*Integer.parseInt(radius.getText()));
   }
  }
 }
 public void windowClosing(WindowEvent e)
 {System.exit(0);
 }
}