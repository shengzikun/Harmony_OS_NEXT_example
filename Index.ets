import { router } from '@kit.ArkUI'
//import test_age from '../test/test_age'
//import {left_date,task_list} from '../test/test_page_date'
import left_Page from '../compose/left_page'
@Entry
@Component
struct Home_page {
 // @State left_date:left_date[]=task_list()
  @Builder
  test_builder(){
      Button(){
        Row(){
          Image($r('app.media.ic_public_home'))
            .backgroundColor($r('app.media.ic_public_drawer'))
            .backgroundColor(Color.Green)
            .fillColor(Color.White)
            .width(40)
            .height(40)
            .borderRadius(50)
        }
        .onClick(()=>{
          router.pushUrl({url:'pages/login'})
        })
      }
  }

  @Builder//设置底部栏样式
  //              标识                   选中图片            未选中图片           文字
  tabarbuilder(iconindex:number,selecticon:ResourceStr,icon:ResourceStr,title:string){
    Column(){
      Image(iconindex==this.slecticon?selecticon:icon)
        .width(20)//判断是否选中以展示高亮
      Text(title)
        .fontColor(iconindex==this.slecticon?Color.Black:Color.Grey)
    }
  }
  @Builder//中心图标
  centericon(iconindex:number,selecticon:ResourceStr,icon:ResourceStr){
    Image(iconindex==this.slecticon?selecticon:icon)
      .width(40)
      .margin({bottom:15})
  }
  @State slecticon:number=0

@State progress:number=5
//===============
  build() {
    Column(){
      Tabs({barPosition:BarPosition.End}){//,确定底部栏位置
        //设置底部左栏
        TabContent(){
          left_Page()
        }
        .tabBar(this.tabarbuilder(0,$r('app.media.ic_public_favor_filled'),$r('app.media.ic_public_favor'),'推荐'))
        //中心
        TabContent(){
          Text(`center-text`)
        }
        .tabBar(this.test_builder())
        //设置底部右栏
        TabContent(){
          Text('center-right')
        }
        .tabBar(this.tabarbuilder(2,$r('app.media.ic_public_home_filled'),$r('app.media.ic_public_home'),'我的'))
      }
      .barBackgroundColor('#CDC9C9')
      .onChange((index:number)=>{//索引标识，确定点击位置
        this.slecticon=index
      })
      //.animationDuration(0)//动画时间
      .scrollable(false)//关闭滑动
    }
  }
}

