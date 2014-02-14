<form name="airline" method="get" action="<?php echo url('/airline/result');?>">
    <table align="center" class="balancesheet" width="70%">
	<tr class="balancesheet_header">
		<td colspan="2">Airline Select</td>
	</tr>
        <tr>
            <td align="right"><b><font color="black" size="3">Select Your Airline:</font></b></td>
            <td align="left" cospan="2">
				<select class="search" name="airline">
                    <option value="">---ALL---</option>
                    <?php
                        foreach ($airlines as $airline)
							{
															
							echo '<option value="'.$airline->code.'">'.$airline->name.'</option>&nbsp;';
							
							}
                    ?>
                </select>
            </td>
			
		</tr>
		<tr>
			<td align="center" colspan="4"><input type="submit" name="submit" value="Search" src="" ></td>
        </tr>
	</table>
</form>