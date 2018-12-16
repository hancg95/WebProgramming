package food.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import food.table.Food;

public class MaterialSelecter {
	public String question(ArrayList<Food> foods)
	{
		String mtrTmp = "";
		Iterator<Food> ItF = foods.iterator();
		while(ItF.hasNext()) // Ư¡�� ���Ƴֱ�
		{
			mtrTmp += ItF.next().getMaterial()+",";
		}
		String mtrArr[] = mtrTmp.split(",");
		
		Map<String,Integer> mtrHash = new HashMap<String,Integer>();
		for(int i=0;i<mtrArr.length;i++) //�Ӽ��� �ߺ� üũ �� ���� üũ
		{
			
			if(!mtrHash.containsKey(mtrArr[i]))
			{
				mtrHash.put(mtrArr[i],1);
			}
			else
			{
				mtrHash.put(mtrArr[i],mtrHash.get(mtrArr[i])+1);
			}
		}
		
		Iterator<String> ItM = mtrHash.keySet().iterator();
		int near = foods.size()/2; //������ 2(����Ʈ����), ���� ���� �߰� ��(������ ������ �ϸ� ������ ���� ��)
		int min = Integer.MAX_VALUE;
		String mindata = "";
		Random random = new Random();
		while(ItM.hasNext()) // �ٻ� �˰��� 
		{
			String key = ItM.next();
			int tmp = Math.abs(mtrHash.get(key)-near); 
			if(min > tmp)
			{
				min = tmp;
				mindata = key;
			}
			else if(min == tmp)
			{
				if(random.nextBoolean())
				{
					mindata = key;
				}
			}
		}
		return mindata; //�ٻ񰪰� ���� ������ ����(Ư¡) ��ȯ
	}
	
	public ArrayList<Food> select(ArrayList<Food> selects, String question, boolean answer) 
	{
		for(int i=0;i<selects.size();i++)
		{
			Food food = selects.get(i);
			boolean chk = false;
			String mtrArr[] = food.getMaterial().split(",");
			for(int j=0;j<mtrArr.length;j++)
			{
				if(mtrArr[j].equals(question)) // Ư���� �ִ��� ������ Ȯ��
					chk = true;
			}
			
			if(chk != answer)
			{
				selects.remove(i);
			}
		}
		
		return selects;
	}

}
