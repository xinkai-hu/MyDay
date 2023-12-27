import BackgroundType from '../model/BackgroundType';
import Folder from '../model/Folder';
import FolderType from '../model/FolderType';
import WeatherData from '../model/WeatherData';

@CustomDialog
export default struct WeatherDialog {
  /**
   * 对话框控制器。
   */
  public controller: CustomDialogController;
  /**
   * 来源文件夹。用于获取背景颜色或背景图片。
   */
  private folder: Folder;
  /**
   * 天气数据。
   */
  private weatherData: WeatherData;

  public build(): void {
    Stack() {
      Column()
        .visibility(this.folder.backgroundType === BackgroundType.COLOR
          ? Visibility.Visible : Visibility.Hidden)
        .size({ width: '100%', height: '100%' })
        .backgroundColor(this.folder.background)
        .border({ radius: 12, color: $r('app.color.font_grey'), width: 1 });
      Column()
        .visibility(this.folder.backgroundType === BackgroundType.PHOTO
          ? Visibility.Visible : Visibility.Hidden)
        .size({ width: '100%', height: '100%' })
        .backgroundImage(this.folder.background)
        .backgroundImageSize(ImageSize.Cover)
        .border({ radius: 12, color: $r('app.color.font_grey'), width: 1 });
      Column()
        .size({ width: '100%', height: '100%' })
        .backgroundColor($r('app.color.pure_white'))
        .opacity(0.7)
        .border({ radius: 12, color: $r('app.color.font_grey'), width: 1 });

      Column() {
        Text('天气实况')
          .margin('2%')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.font_black'));

        Row() {
          Text(this.weatherData.province + this.weatherData.city)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_black'));
        }
        .padding('2%')
        .backgroundColor($r('app.color.main_background'))
        .margin('2%')
        .border({ radius: 12 });

        Row() {
          Text('天气：' + this.weatherData.weather)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_black'));
        }
        .padding('2%')
        .backgroundColor($r('app.color.main_background'))
        .margin('2%')
        .border({ radius: 12 });

        Row() {
          Text('气温：' + this.weatherData.temperature_float + '摄氏度')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_black'));
        }
        .padding('2%')
        .margin('2%')
        .backgroundColor($r('app.color.main_background'))
        .border({ radius: 12 });

        Row() {
          Text(this.weatherData.winddirection + '风' + this.weatherData.windpower + '级')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_black'));
        }
        .padding('2%')
        .margin('2%')
        .backgroundColor($r('app.color.main_background'))
        .border({ radius: 12 });

        Row() {
          Text('空气湿度' + this.weatherData.humidity_float + '%')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_black'));
        }
        .padding('2%')
        .margin('2%')
        .backgroundColor($r('app.color.main_background'))
        .border({ radius: 12 });

        Text('上一次刷新时间：' + this.weatherData.reporttime)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.font_grey'));
      }
      .size({ width: '100%', height: '100%' })
      .padding('2%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start);
    }
    .margin('2%')
    .border({ radius: 12, color: $r('app.color.font_grey'), width: 1 })
    .size({ width: '96%', height: '48%' });
  }
}